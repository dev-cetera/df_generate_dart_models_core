import 'package:df_generate_dart_models_core/df_generate_dart_models_core_utils.dart';
import 'package:test/test.dart';

void main() {
  group('decomposeDartCollectionType — extensive', () {
    test('non-generic List → empty', () {
      final result = decomposeDartCollectionType('List');
      expect(result, isEmpty);
    });

    test('List<String>', () {
      final result = decomposeDartCollectionType('List<String>');
      expect(result.toString(), '([List<String>, List, String])');
    });

    test('List<String>?', () {
      final result = decomposeDartCollectionType('List<String>?');
      expect(result.toString(), '([List<String>?, List?, String])');
    });

    test('List<dynamic>', () {
      final result = decomposeDartCollectionType('List<dynamic>');
      expect(result.toString(), '([List<dynamic>, List, dynamic])');
    });

    test('Map<String,int>', () {
      final result = decomposeDartCollectionType('Map<String,int>');
      expect(result.toString(), '([Map<String,int>, Map, String, int])');
    });

    test('Map<String, int> with space', () {
      final result = decomposeDartCollectionType('Map<String, int>');
      expect(result.toString(), '([Map<String,int>, Map, String, int])');
    });

    test('Set<int>', () {
      final result = decomposeDartCollectionType('Set<int>');
      expect(result.toString(), '([Set<int>, Set, int])');
    });

    test('nested List<List<String>>', () {
      final result = decomposeDartCollectionType('List<List<String>>');
      // The outer should be parsed, then inner.
      // Documented expected:
      //   ([List<************>, List, ************], [List<String>, List, String])
      // Note the asterisks count = length of "List<String>" = 12.
      expect(result.length, 2);
      print('nested list: $result');
    });

    test('Map of List values', () {
      final result = decomposeDartCollectionType('Map<String,List<int>>');
      print('map of list: $result');
      expect(result.length, 2);
    });

    test('triple nested: List<Map<String,List<int>>>', () {
      final result = decomposeDartCollectionType('List<Map<String,List<int>>>');
      print('triple nested: $result');
      expect(result.length, 3);
    });
  });
}
