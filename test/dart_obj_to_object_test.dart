// Tests for [dartObjToObject] and [dartObjToStringList]. These functions
// expect a `dynamic` that quacks like an analyzer `DartObject` — exposing
// `toStringValue() / toIntValue() / toBoolValue() / toDoubleValue() /
// toListValue() / toSetValue() / toMapValue()`. We feed them a minimal stub
// so the tests don't need to spin up the analyzer.

import 'package:df_generate_dart_models_core/df_generate_dart_models_core_utils.dart';
import 'package:test/test.dart';

/// Stub of a `DartObject`-shaped value. Only the relevant `to*Value`
/// method returns non-null for any given instance.
class _Obj {
  final String? _s;
  final int? _i;
  final bool? _b;
  final double? _d;
  final List<_Obj>? _l;
  final Set<_Obj>? _se;
  final Map<_Obj, _Obj>? _m;

  const _Obj.s(String s)
      : _s = s,
        _i = null,
        _b = null,
        _d = null,
        _l = null,
        _se = null,
        _m = null;
  const _Obj.i(int i)
      : _s = null,
        _i = i,
        _b = null,
        _d = null,
        _l = null,
        _se = null,
        _m = null;
  const _Obj.b(bool b)
      : _s = null,
        _i = null,
        _b = b,
        _d = null,
        _l = null,
        _se = null,
        _m = null;
  const _Obj.d(double d)
      : _s = null,
        _i = null,
        _b = null,
        _d = d,
        _l = null,
        _se = null,
        _m = null;
  const _Obj.l(List<_Obj> l)
      : _s = null,
        _i = null,
        _b = null,
        _d = null,
        _l = l,
        _se = null,
        _m = null;
  const _Obj.se(Set<_Obj> s)
      : _s = null,
        _i = null,
        _b = null,
        _d = null,
        _l = null,
        _se = s,
        _m = null;
  const _Obj.m(Map<_Obj, _Obj> m)
      : _s = null,
        _i = null,
        _b = null,
        _d = null,
        _l = null,
        _se = null,
        _m = m;

  // Mimic the real `DartObject` API: return null if this instance doesn't
  // hold that kind of value. dartObjToObject relies on try/catch flow but
  // dartObjToStringList uses the null result, so null is the safer stub.
  String? toStringValue() => _s;
  int? toIntValue() => _i;
  bool? toBoolValue() => _b;
  double? toDoubleValue() => _d;
  List<_Obj>? toListValue() => _l;
  Set<_Obj>? toSetValue() => _se;
  Map<_Obj, _Obj>? toMapValue() => _m;
}

void main() {
  group('dartObjToObject', () {
    test('null input returns null', () {
      expect(dartObjToObject(null), isNull);
    });

    test('string', () {
      expect(dartObjToObject(const _Obj.s('hello')), 'hello');
    });

    test('int', () {
      expect(dartObjToObject(const _Obj.i(42)), 42);
    });

    test('bool', () {
      expect(dartObjToObject(const _Obj.b(true)), isTrue);
    });

    test('double', () {
      expect(dartObjToObject(const _Obj.d(3.14)), 3.14);
    });

    test('list of strings returns a real List (not a lazy Iterable)', () {
      // Regression: callers (e.g. extract_insights_from_file's `children:`
      // parser) cast the result to `List` — a lazy Iterable would throw
      // TypeError there. Verify the dynamic type is List, not Iterable.
      final r = dartObjToObject(
        const _Obj.l([_Obj.s('a'), _Obj.s('b')]),
      );
      expect(r, isA<List<dynamic>>());
      expect(r, ['a', 'b']);
    });

    test('set of ints returns a real Set (not a lazy Iterable)', () {
      final r = dartObjToObject(
        const _Obj.se({_Obj.i(1), _Obj.i(2)}),
      );
      expect(r, isA<Set<dynamic>>());
      expect(r, {1, 2});
    });

    test('list of maps survives the `as List` cast used by callers', () {
      // Direct mirror of the extract_insights_from_file children path.
      final r = dartObjToObject(
        const _Obj.l([
          _Obj.m({_Obj.s('k'): _Obj.s('v')}),
        ]),
      ) as List?;
      expect(r, isNotNull);
      expect(r!.length, 1);
      expect((r.first as Map)['k'], 'v');
    });

    test('map of string keys to int values', () {
      final r = dartObjToObject(
        const _Obj.m({_Obj.s('a'): _Obj.i(1)}),
      ) as Map;
      expect(r, {'a': 1});
    });
  });

  group('dartObjToStringList', () {
    test('null input returns null', () {
      expect(dartObjToStringList(null), isNull);
    });

    test('single string wraps in a list', () {
      expect(dartObjToStringList(const _Obj.s('only')), ['only']);
    });

    test('list of strings is unwrapped', () {
      final r = dartObjToStringList(const _Obj.l([_Obj.s('a'), _Obj.s('b')]));
      expect(r, ['a', 'b']);
    });
  });
}
