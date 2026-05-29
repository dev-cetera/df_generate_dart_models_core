import 'package:df_generate_dart_models_core/df_generate_dart_models_core_utils.dart';
import 'package:test/test.dart';

void main() {
  group('DartField.fieldType — _expandDynamicTypes', () {
    test('plain Map expands to Map<dynamic, dynamic>', () {
      final f = const DartField(fieldPath: ['a'], fieldType: 'Map');
      expect(f.fieldType, 'Map<dynamic, dynamic>');
    });

    test('plain List expands to List<dynamic>', () {
      final f = const DartField(fieldPath: ['a'], fieldType: 'List');
      expect(f.fieldType, 'List<dynamic>');
    });

    test('plain Set expands to Set<dynamic>', () {
      final f = const DartField(fieldPath: ['a'], fieldType: 'Set');
      expect(f.fieldType, 'Set<dynamic>');
    });

    test('typed Map<String,int> is NOT expanded', () {
      final f = const DartField(fieldPath: ['a'], fieldType: 'Map<String,int>');
      expect(f.fieldType, 'Map<String,int>');
    });

    test('union Map|String: Map SHOULD expand per docstring', () {
      // The comment in _expandDynamicTypes says:
      //   "but it will also match if the key is followed by '|' and any text"
      // So "Map|String" should become "Map<dynamic, dynamic>|String".
      final f = const DartField(fieldPath: ['a'], fieldType: 'Map|String');
      print('Map|String → ${f.fieldType}');
      expect(f.fieldType, 'Map<dynamic, dynamic>|String');
    });

    test('union Iterable|int: Iterable SHOULD expand', () {
      final f = const DartField(fieldPath: ['a'], fieldType: 'Iterable|int');
      print('Iterable|int → ${f.fieldType}');
      expect(f.fieldType, 'Iterable<dynamic>|int');
    });

    test('HashMap does not erroneously match Map', () {
      final f = const DartField(fieldPath: ['a'], fieldType: 'HashMap');
      expect(f.fieldType, 'HashMap<dynamic, dynamic>');
    });

    test('Nested raw List inside typed Set: Set<List>', () {
      final f = const DartField(fieldPath: ['a'], fieldType: 'Set<List>');
      print('Set<List> → ${f.fieldType}');
      // The inner List has no <…>, so should be expanded.
      expect(f.fieldType, 'Set<List<dynamic>>');
    });
  });

  group('DartField accepts Type-literal fieldType (regression)', () {
    test('Type-valued fieldType does not throw on fieldType getter', () {
      // Previously _isFieldTypeNullable called .endsWith on the raw value;
      // for a `Type` literal this threw NoSuchMethodError instead of just
      // returning false.
      const f = DartField(fieldPath: ['a'], fieldType: String);
      // Should be 'String' (Type.toString) with no nullable suffix.
      expect(f.fieldType, 'String');
      expect(f.nullable, isFalse);
      expect(f.fieldTypeCode, 'String');
    });

    test('Type-valued generic fieldType is expanded correctly', () {
      const f = DartField(fieldPath: ['a'], fieldType: Map);
      // Map (Type) → toString = 'Map' → _expandDynamicTypes → Map<dynamic, dynamic>.
      expect(f.fieldType, 'Map<dynamic, dynamic>');
    });
  });
}
