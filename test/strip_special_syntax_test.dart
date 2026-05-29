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
  });
}
