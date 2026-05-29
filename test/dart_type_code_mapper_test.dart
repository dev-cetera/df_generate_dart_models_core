import 'package:df_gen_core/df_gen_core.dart';
import 'package:df_generate_dart_models_core/df_generate_dart_models_core_utils.dart';
import 'package:test/test.dart';

void main() {
  group('DartTypeCodeMapper.map', () {
    test('object type uses object mapper', () {
      final mappers = newTypeMap<MapperEvent>({
        r'^(int)\??$': (e) => 'INT(${e.name})',
      });
      final m = DartTypeCodeMapper(mappers);
      expect(m.map(fieldName: 'age', fieldTypeCode: 'int'), 'INT(age)');
    });

    test('collection type substitutes field name into p0', () {
      final mappers = newTypeMap<MapperEvent>({
        r'^(List)\??$': (e) {
          final c = e as CollectionMapperEvent;
          return 'LIST(${c.hashes})';
        },
        r'^(int)\??$': (e) => 'INT(${e.name})',
      });
      final m = DartTypeCodeMapper(mappers);
      // The formula's "p0" gets replaced with the actual field name.
      final r = m.map(fieldName: 'nums', fieldTypeCode: 'List<int>');
      expect(r, 'LIST(INT(nums))');
    });

    test('falls back to mapObject when collection produces only #x0', () {
      final mappers = newTypeMap<MapperEvent>({
        r'^(String)\??$': (e) => 'S(${e.name})',
      });
      final m = DartTypeCodeMapper(mappers);
      // 'String' isn't a collection, so collection step yields #x0 and we
      // fall back to object mapping.
      expect(m.map(fieldName: 'n', fieldTypeCode: 'String'), 'S(n)');
    });
  });
}
