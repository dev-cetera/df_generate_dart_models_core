import 'dart:convert';

import 'package:df_generate_dart_models_core/df_generate_dart_models_core.dart';
import 'package:test/test.dart';

/// A hand-written stand-in for a generated model: `fromUriOrNull` and
/// `fromJsonOrNull` follow the shape the featured template emits.
final class _Fixture extends BaseModel {
  final String? name;
  final int? count;
  final bool? flag;
  final List<String>? tags;
  final Map<String, dynamic>? meta;

  const _Fixture({this.name, this.count, this.flag, this.tags, this.meta});

  @override
  String get $className => '_Fixture';

  @override
  Map<String, dynamic> toJson({bool includeNulls = false}) {
    final json = <String, dynamic>{
      'name': name,
      'count': count,
      'flag': flag,
      'tags': tags,
      'meta': meta,
    };
    if (!includeNulls) json.removeWhere((_, v) => v == null);
    return json;
  }

  static _Fixture? fromUriOrNull(Uri? uri) {
    if (uri == null || uri.path != '_Fixture') return null;
    return fromJsonOrNull(uri.queryParameters);
  }

  static _Fixture? fromJsonOrNull(Map<String, dynamic>? json) {
    return _Fixture(
      name: json?['name']?.toString().trim().nullIfEmpty,
      count: letIntOrNull(json?['count']),
      flag: letBoolOrNull(json?['flag']),
      tags: letListOrNull<dynamic>(json?['tags'])
          ?.map((p0) => p0?.toString().trim().nullIfEmpty)
          .nonNulls
          .toList(),
      meta: letMapOrNull<String, dynamic>(json?['meta']),
    );
  }
}

final class _Unencodable extends BaseModel {
  const _Unencodable();

  @override
  String get $className => '_Unencodable';

  @override
  Map<String, dynamic> toJson({bool includeNulls = false}) {
    throw StateError(r'bad "quote" and \ backslash');
  }
}

void main() {
  group('BaseModel.toUrl', () {
    test('scalar values are written with toString(), as before', () {
      const model = _Fixture(name: 'a b', count: 3, flag: true);
      final url = model.toUrl();
      expect(url.path, '_Fixture');
      expect(
        url.queryParameters,
        {'name': 'a b', 'count': '3', 'flag': 'true'},
      );
    });

    test('lists and maps are JSON-encoded', () {
      const model = _Fixture(
        tags: ['x', 'y, z'],
        meta: {
          'k': 1,
          'nested': [true, null],
        },
      );
      final url = model.toUrl();
      expect(jsonDecode(url.queryParameters['tags']!), ['x', 'y, z']);
      expect(jsonDecode(url.queryParameters['meta']!), {
        'k': 1,
        'nested': [true, null],
      });
    });

    test('a model with list and map fields round-trips through its Uri', () {
      const model = _Fixture(
        name: 'n',
        count: 7,
        flag: false,
        tags: ['a', 'b'],
        meta: {
          'k': 'v',
          'inner': {'n': 1},
        },
      );
      final back = _Fixture.fromUriOrNull(Uri.parse(model.toUrl().toString()));
      expect(back!.toJson(), model.toJson());
    });

    test('a generated model with a list field round-trips (DataRefModel)', () {
      const model = DataRefModel(id: 'p1', collection: ['users', 'u1']);
      final back = DataRefModel.fromUriOrNull(
        Uri.parse(model.toUrl().toString()),
      );
      expect(back, model);
      expect(back!.collection, ['users', 'u1']);
    });
  });

  group('BaseModel.toJsonString', () {
    test('encodes the sorted JSON with indentation', () {
      const model = _Fixture(name: 'n', count: 1);
      expect(
        model.toJsonString(),
        const JsonEncoder.withIndent('  ').convert({'count': 1, 'name': 'n'}),
      );
    });

    test('the error fallback is valid JSON even when the error has quotes', () {
      const model = _Unencodable();
      final out = model.toJsonString();
      final decoded = jsonDecode(out) as Map<String, dynamic>;
      expect(decoded.keys, ['e']);
      expect(decoded['e'], r'Bad state: bad "quote" and \ backslash');
    });
  });
}
