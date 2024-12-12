//.title
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//
// Dart/Flutter (DF) Packages by DevCetra.com & contributors. The use of this
// source code is governed by an MIT-style license described in the LICENSE
// file located in this project's root directory.
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
      return dartObj.toListValue()!.map((dynamic e) => dartObjToObject(e));
    } catch (_) {}
    try {
      return dartObj.toSetValue()!.map((dynamic e) => dartObjToObject(e));
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
