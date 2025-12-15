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

extension type DartFromRecordOnDartObjectX(_DartObject dartObj) {
  //
  //
  //

  /// Returns `fieldName` property from [dartObj] if it matches the structure of
  /// [TFieldRecord] or `null`.
  List<String>? fieldPathFromRecord() {
    return _rawFieldPathFromRecord()
        ?.map((e) => e.replaceAll('?', ''))
        .toList();
  }

  List<String>? _rawFieldPathFromRecord() {
    final a = dartObjToStringList(dartObj.getField('\$1'));
    final b = dartObjToStringList(
      dartObj.getField(FieldModelFieldNames.fieldPath),
    );
    return (a ?? b)?.toList();
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
        dartObj
                .getField('\$2')
                ?.toTypeValue()
                ?.getDisplayString(withNullability: true)
            as String?;
    final c =
        dartObj.getField(FieldModelFieldNames.fieldType)?.toStringValue()
            as String?;
    final d =
        dartObj
                .getField(FieldModelFieldNames.fieldType)
                ?.toTypeValue()
                ?.getDisplayString(withNullability: true)
            as String?;
    return a ?? b ?? c ?? d;
  }

  /// Returns the `nullable` property from [dartObj] if it matches thestructure of
  /// [TFieldRecord] or `null`.
  bool? nullableFromRecord() {
    if (fieldTypeFromRecord() == 'dynamic') {
      return false;
    }

    final a =
        dartObj.getField(FieldModelFieldNames.nullable)?.toBoolValue() as bool?;
    final b = dartObj.getField('\$3')?.toBoolValue() as bool?;
    final c = _rawFieldPathFromRecord()?.any((e) => e.contains('?'));
    final d = _rawFieldTypeFromRecord()?.endsWith('?');
    return a ?? b ?? ((c ?? false) || (d ?? false));
  }

  /// Returns the `children` property from [dartObj] if it matches the structure of
  /// [TFieldRecord] or `null`.
  List<Map<String, dynamic>>? childrenFromRecord() {
    final a =
        dartObj
                .getField(FieldModelFieldNames.children)
                ?.toListValue()
                ?.map(
                  (e) => e.toMapValue()!.map(
                    (k, v) => MapEntry(k!.toStringValue()!, dartObjToObject(v)),
                  ),
                )
            as Iterable?;
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

  /// Retrieves the `fallback` property from this `DartObject` if it matches
  /// the structure of [TFieldRecord] or returns `null`.
  Object? fallbackFromRecord() {
    final fallbackField = dartObj.getField(FieldModelFieldNames.fallback);
    return dartObjToObject(fallbackField);
  }

  /// Returns the `description` property from [dartObj] record if it matches the
  /// structure of [TFieldRecord] or `null`.
  String? descriptionFromRecord() {
    return dartObj.getField(FieldModelFieldNames.description)?.toStringValue()
        as String?;
  }
}
