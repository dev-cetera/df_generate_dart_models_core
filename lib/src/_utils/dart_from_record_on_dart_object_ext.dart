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
    final b = dartObj
        .getField('\$2')
        ?.toTypeValue()
        ?.getDisplayString(withNullability: true) as String?;
    final c = dartObj.getField(FieldModelFieldNames.fieldType)?.toStringValue()
        as String?;
    final d = dartObj
        .getField(FieldModelFieldNames.fieldType)
        ?.toTypeValue()
        ?.getDisplayString(withNullability: true) as String?;
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

  /// Returns the `references` property — the target model class as a Type
  /// reference — from [dartObj] if it matches the structure of [TFieldRecord]
  /// or `null`. Read as a display-string so the generator gets the target
  /// class name without depending on the analyzer's Type API.
  String? referencesFromRecord() {
    return dartObj
        .getField(FieldModelFieldNames.references)
        ?.toTypeValue()
        ?.getDisplayString(withNullability: false) as String?;
  }

  /// Returns the `referencesColumn` property from [dartObj] or `null`.
  String? referencesColumnFromRecord() {
    return dartObj
        .getField(FieldModelFieldNames.referencesColumn)
        ?.toStringValue() as String?;
  }

  /// Returns the `unique` property from [dartObj] or `null`.
  bool? uniqueFromRecord() {
    return dartObj.getField(FieldModelFieldNames.unique)?.toBoolValue()
        as bool?;
  }

  /// Returns the `onDelete` property from [dartObj] or `null`.
  String? onDeleteFromRecord() {
    return dartObj.getField(FieldModelFieldNames.onDelete)?.toStringValue()
        as String?;
  }

  /// Returns the `sqlType` property from [dartObj] or `null`.
  String? sqlTypeFromRecord() {
    return dartObj.getField(FieldModelFieldNames.sqlType)?.toStringValue()
        as String?;
  }

  /// Returns the `unknownEnumValue` property from [dartObj] as its source
  /// expression (display name). Enum constants in annotations show up via
  /// `getField` as enum-typed DartObjects whose `getField('_name')` carries
  /// the constant name; falling back to `getDisplayString` covers the rest.
  String? unknownEnumValueFromRecord() {
    final field = dartObj.getField(FieldModelFieldNames.unknownEnumValue);
    if (field == null) return null;
    // Try enum-constant shape first: prints as `EnumType.constantName`.
    final variable = field.variable;
    if (variable != null) {
      final enclosing = variable.enclosingElement;
      final enumName = enclosing?.name;
      final constName = variable.name;
      if (enumName != null && constName != null) {
        return '$enumName.$constName';
      }
    }
    // Type-valued fallback.
    final asType = field.toTypeValue()?.getDisplayString(withNullability: false)
        as String?;
    if (asType != null) return asType;
    // String literal fallback (`unknownEnumValue: 'unknown'`).
    return field.toStringValue() as String?;
  }

  /// Returns the `includeInJson` property from [dartObj] or `null`.
  bool? includeInJsonFromRecord() {
    return dartObj
        .getField(FieldModelFieldNames.includeInJson)
        ?.toBoolValue() as bool?;
  }

  /// Returns the `includeInSqlMap` property from [dartObj] or `null`.
  bool? includeInSqlMapFromRecord() {
    return dartObj
        .getField(FieldModelFieldNames.includeInSqlMap)
        ?.toBoolValue() as bool?;
  }

  /// Returns the `includeInFirestoreMap` property from [dartObj] or `null`.
  bool? includeInFirestoreMapFromRecord() {
    return dartObj
        .getField(FieldModelFieldNames.includeInFirestoreMap)
        ?.toBoolValue() as bool?;
  }

  /// Returns the `converter` property as a class display name, like
  /// [referencesFromRecord]. The runtime FieldModel stores a String.
  String? converterFromRecord() {
    return dartObj
        .getField(FieldModelFieldNames.converter)
        ?.toTypeValue()
        ?.getDisplayString(withNullability: false) as String?;
  }
}
