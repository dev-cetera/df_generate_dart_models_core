import 'package:df_generate_dart_models_core/df_generate_dart_models_core_utils.dart';
import 'package:test/test.dart';

void main() {
  group('stripSpecialSyntaxFromFieldType', () {
    test('removes spaces', () {
      expect(
        stripSpecialSyntaxFromFieldType('Map<String, int>'),
        'Map<String,int>',
      );
    });

    test("strips '@let'", () {
      expect(stripSpecialSyntaxFromFieldType('@letString'), 'String');
    });

    test('reduces hyphen-prefixed case sequences to last word', () {
      // "LowerCase-String" → "String".
      expect(stripSpecialSyntaxFromFieldType('LowerCase-String'), 'String');
    });

    test('@clean expansion strips ? and rewrites <,> to <,>', () {
      final r = stripSpecialSyntaxFromFieldType('Foo@clean<Bar?,Baz>');
      expect(r, 'Foo<Bar, Baz>');
    });

    test('plain type passes through untouched', () {
      expect(stripSpecialSyntaxFromFieldType('String'), 'String');
    });

    test('combined input survives all steps', () {
      // Removes spaces, strips @let, normalises case-prefix, expands @clean.
      final r =
          stripSpecialSyntaxFromFieldType('@let Map<LowerCase-String, int>');
      expect(r, 'Map<String,int>');
    });

    test('parenthesised prefix params are consumed (PG_varchar(255))', () {
      expect(
        stripSpecialSyntaxFromFieldType('PG_varchar(255)-String'),
        'String',
      );
    });

    test('numeric precision in prefix is consumed (PG_numeric(10,2))', () {
      expect(
        stripSpecialSyntaxFromFieldType('PG_numeric(10,2)-String'),
        'String',
      );
    });

    test('array marker on prefix is consumed (PG_text[])', () {
      expect(
        stripSpecialSyntaxFromFieldType('PG_text[]-List<String>'),
        'List<String>',
      );
    });

    test('parenthesised array prefix (PG_varchar(255)[])', () {
      expect(
        stripSpecialSyntaxFromFieldType('PG_varchar(255)[]-List<String>'),
        'List<String>',
      );
    });

    test('PG_enum carries the postgres enum name in parens', () {
      expect(
        stripSpecialSyntaxFromFieldType(
          'PG_enum(auth_provider_kind)-AuthProviderKindType',
        ),
        'AuthProviderKindType',
      );
    });

    test('chained prefixes still collapse (Trimmed-PG_text-String)', () {
      expect(
        stripSpecialSyntaxFromFieldType('Trimmed-PG_text-String'),
        'String',
      );
    });
  });
}
