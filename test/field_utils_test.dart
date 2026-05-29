import 'package:df_generate_dart_models_core/df_generate_dart_models_core.dart';
import 'package:test/test.dart';

void main() {
  group('FieldUtils.fieldTypeOrNull', () {
    test('extracts String fieldType from a record', () {
      const r = (
        fieldPath: ['a'],
        fieldType: 'int',
        nullable: true,
        children: null,
        primaryKey: null,
        foreignKey: null,
        fallback: null,
        description: null,
      );
      expect(FieldUtils.fieldTypeOrNull(r), 'int');
    });

    test('extracts a String fieldType from a FieldModel', () {
      const m = FieldModel(fieldType: 'int');
      expect(FieldUtils.fieldTypeOrNull(m), 'int');
    });

    test('Type fieldType is preserved via toString (regression)', () {
      // Before the fix, `unknown.fieldType as String` threw a TypeError for
      // Type literals like `String`, `Map`, etc., so the call swallowed the
      // failure and returned null — losing the user-supplied type.
      const m = FieldModel(fieldType: String);
      expect(FieldUtils.fieldTypeOrNull(m), 'String');
    });

    test('generic Type fieldType is preserved via toString', () {
      const m = FieldModel(fieldType: List<String>);
      // The toString of `List<String>` is exactly "List<String>".
      expect(FieldUtils.fieldTypeOrNull(m), 'List<String>');
    });

    test('null fieldType returns null', () {
      const m = FieldModel.optional(); // fieldType is null
      expect(FieldUtils.fieldTypeOrNull(m), isNull);
    });
  });
}
