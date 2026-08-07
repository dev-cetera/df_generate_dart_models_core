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

// ignore_for_file: inference_failure_on_untyped_parameter

// Let's avoid depending on the analyzer package.
//import 'package:analyzer/dart/constant/value.dart';

import 'dart_obj_to_string_list.dart';
import 'dart_obj_to_object.dart';
import '../models/field_model/field_model.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

typedef _DartObject = dynamic;
//typedef _DartObject = DartObject;

extension type DartFromRecordOnDartObjectExt(_DartObject dartObj) {
  //
  //
  //

  /// Returns the `fieldPath` property from [dartObj] if it matches the
  /// structure of [TFieldRecord] / [FieldModel], or `null`.
  ///
  /// The annotation may have used a dot-separated `String`
  /// (`fieldPath: 'profile.id'`) or an `Iterable<String>`
  /// (`fieldPath: ['profile', 'id']`); both shapes normalise to the same
  /// `List<String>` of path segments.
  List<String>? fieldPathFromRecord() {
    return _rawFieldPathFromRecord()
        ?.map((e) => e.replaceAll('?', ''))
        .toList();
  }

  List<String>? _rawFieldPathFromRecord() {
    // Resolve the raw DartObject first — positional `$1` (record shape) or the
    // named `fieldPath` field (FieldModel shape). Either may be set; whichever
    // is non-null wins.
    final raw = dartObj.getField('\$1') ??
        dartObj.getField(FieldModelFieldNames.fieldPath);
    if (raw == null) return null;

    // String form first: a dot-separated literal like 'profile.id' must split
    // into ['profile', 'id']. Doing this *before* probing for a list shape
    // avoids `dartObjToStringList` wrapping a single string as `[s]` (which
    // would collapse multi-segment paths into one key).
    final asString = raw.toStringValue() as String?;
    if (asString != null) {
      if (asString.isEmpty) return null;
      return asString.split('.');
    }

    // List/Iterable form: ['profile', 'id'].
    final asList = dartObjToStringList(raw);
    return asList?.toList();
  }

  /// Returns the `fieldType` property from [dartObj] if it matches the structure
  /// of [TFieldRecord] or `null`.
  String? fieldTypeFromRecord() {
    final raw = _rawFieldTypeFromRecord();
    if (raw != null) {
      return raw.endsWith('?') || raw.endsWith('*')
          ? raw.substring(0, raw.length - 1)
          : raw;
    }
    return null;
  }

  String? _rawFieldTypeFromRecord() {
    final a = dartObj.getField('\$2')?.toStringValue() as String?;
    final b =
        dartObj.getField('\$2')?.toTypeValue()?.getDisplayString() as String?;
    final c = dartObj.getField(FieldModelFieldNames.fieldType)?.toStringValue()
        as String?;
    final d = dartObj
        .getField(FieldModelFieldNames.fieldType)
        ?.toTypeValue()
        ?.getDisplayString() as String?;
    return a ?? b ?? c ?? d;
  }

  /// Returns the `nullable` property from [dartObj] if it matches thestructure of
  /// [TFieldRecord] or `null`.
  ///
  /// Explicit `nullable: true|false` on the annotation always wins so a
  /// `Field(fieldType: dynamic, nullable: true, ...)` (or `Object`) can opt
  /// into nullability. When the flag is absent, `dynamic` defaults to
  /// non-nullable to preserve the historic "no `?` suffix => `dynamic`"
  /// shorthand.
  bool? nullableFromRecord() {
    final a =
        dartObj.getField(FieldModelFieldNames.nullable)?.toBoolValue() as bool?;
    final b = dartObj.getField('\$3')?.toBoolValue() as bool?;
    if (a != null) return a;
    if (b != null) return b;
    if (fieldTypeFromRecord() == 'dynamic') {
      return false;
    }
    final c = _rawFieldPathFromRecord()?.any((e) => e.contains('?'));
    final d = _rawFieldTypeFromRecord()?.endsWith('?');
    return ((c ?? false) || (d ?? false));
  }

  /// Returns the `children` property from [dartObj] if it matches the structure of
  /// [TFieldRecord] or `null`.
  List<Map<String, dynamic>>? childrenFromRecord() {
    final a =
        dartObj.getField(FieldModelFieldNames.children)?.toListValue()?.map(
              (e) => e.toMapValue()!.map(
                    (k, v) => MapEntry(k!.toStringValue()!, dartObjToObject(v)),
                  ),
            ) as Iterable?;
    final b = a?.map((e) => (e as Map).cast<String, dynamic>()).toList();
    return b;
  }

  /// Returns the `primaryKey` property from [dartObj] if it matches the structure
  /// of [TFieldRecord] or `null`.
  bool? primaryKeyFromRecord() {
    return dartObj.getField(FieldModelFieldNames.primaryKey)?.toBoolValue()
        as bool?;
  }

  /// Returns the `foreignKey` property from [dartObj] if it matches the
  /// structure of [TFieldRecord] or `null`.
  bool? foreignKeyFromRecord() {
    return dartObj.getField(FieldModelFieldNames.foreignKey)?.toBoolValue()
        as bool?;
  }

  /// Returns the `description` property from [dartObj] record if it matches the
  /// structure of [TFieldRecord] or `null`.
  String? descriptionFromRecord() {
    return dartObj.getField(FieldModelFieldNames.description)?.toStringValue()
        as String?;
  }

  /// Returns the `references` property — the target model class — from
  /// [dartObj] as a display-string, or `null` if absent. Accepts either:
  ///
  ///  - A `Type` literal (`references: ModelUser`) — read via `toTypeValue()`.
  ///  - A `String` literal (`references: 'ModelUser'`) — read via
  ///    `toStringValue()`. Useful in cross-package projects where importing
  ///    every target model just to satisfy a Type literal would add noise.
  ///
  /// The generator only needs the class name, so we collapse both shapes to
  /// the same `String?` and stay independent of the analyzer's Type API.
  String? referencesFromRecord() {
    final raw = dartObj.getField(FieldModelFieldNames.references);
    if (raw == null) return null;
    final asType = raw.toTypeValue()?.getDisplayString() as String?;
    if (asType != null) return asType;
    return raw.toStringValue() as String?;
  }

  /// Returns the `columnDefault` property from [dartObj] record if it matches
  /// the structure of [TFieldRecord] or `null`. Consumed by the DBML emitter
  /// to render `default: <value>`.
  String? columnDefaultFromRecord() {
    return dartObj.getField(FieldModelFieldNames.columnDefault)?.toStringValue()
        as String?;
  }
}
