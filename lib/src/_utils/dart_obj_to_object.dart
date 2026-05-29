//.title
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//
// Copyright © dev-cetera.com & contributors.
//
// The use of this source code is governed by an MIT-style license described in
// the LICENSE file located in this project's root directory.
//
// See: https://opensource.org/license/mit
//
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//.title~

Object? dartObjToObject(dynamic dartObj) {
  if (dartObj != null) {
    try {
      return dartObj.toStringValue()!;
    } catch (_) {}
    try {
      return dartObj.toIntValue()!;
    } catch (_) {}

    try {
      return dartObj.toBoolValue()!;
    } catch (_) {}
    try {
      return dartObj.toDoubleValue()!;
    } catch (_) {}
    try {
      // Eagerly materialise to a `List` (not a lazy `Iterable`) so callers
      // can cast the result to `List` — which the analyzer-driven extraction
      // path in df_generate_dart_models does for `children:`.
      return (dartObj.toListValue()! as Iterable<dynamic>)
          .map((dynamic e) => dartObjToObject(e))
          .toList();
    } catch (_) {}
    try {
      return (dartObj.toSetValue()! as Iterable<dynamic>)
          .map((dynamic e) => dartObjToObject(e))
          .toSet();
    } catch (_) {}
    try {
      return dartObj.toMapValue()!.map(
            (dynamic k, dynamic v) =>
                MapEntry(dartObjToObject(k), dartObjToObject(v)),
          );
    } catch (_) {}
  }
  return null;
}
