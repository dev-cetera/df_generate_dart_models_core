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

import '/df_generate_dart_models_core.dart';

part '_field_model.g.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

const FIELD_MODEL_FIELDS = {
  Field(
    fieldPath: ['fieldPath'],
    fieldType: List<String>,
    nullable: true,
    description: 'The path of the field within the model, represented as a list of strings.',
  ),
  Field(
    fieldPath: ['fieldType'],
    fieldType: dynamic,
    nullable: true,
    description: 'The data type of the field, such as "String", "int", or any dynamic type.',
  ),
  Field(
    fieldPath: ['nullable'],
    fieldType: bool,
    nullable: true,
    description: 'Whether the field can hold a null value.',
  ),
  Field(
    fieldPath: ['children'],
    fieldType: List<Map<String, dynamic>>,
    nullable: true,
    description: 'Children of this field, allowing for nested fields or complex structures.',
  ),
  Field(
    fieldPath: ['primaryKey'],
    fieldType: bool,
    nullable: true,
    description: 'Whether this field serves as a primary key.',
  ),
  Field(
    fieldPath: ['foreignKey'],
    fieldType: bool,
    nullable: true,
    description: 'Whether this field serves as a foreign key.',
  ),
  Field(
    fieldPath: ['fallback'],
    fieldType: Object,
    nullable: true,
    description:
        'The default/fallback value for the field, to use in cases where the value is null.',
  ),
  Field(
    fieldPath: ['description'],
    fieldType: String,
    nullable: true,
    description: "A brief comment or explanation for the field's purpose.",
  ),
};

@GenerateDartModel(shouldInherit: true, fields: FIELD_MODEL_FIELDS)

/// Represents a field, its name, type, and its nullability. Similar to
/// [TFieldRecord].
abstract class _FieldModel extends BaseModel {
  const _FieldModel();

  /// The type code of the field (the type with any special characters, such
  /// as 'String?').
  String? get fieldTypeCode => (this as FieldModel).fieldType.toString();

  /// Converts this to a [TFieldRecord].
  TFieldRecord get toRecord => (
        fieldPath: (this as FieldModel).fieldPath,
        fieldType: (this as FieldModel).fieldType,
        nullable: (this as FieldModel).nullable,
        children: (this as FieldModel).children,
        primaryKey: (this as FieldModel).primaryKey,
        foreignKey: (this as FieldModel).foreignKey,
        fallback: (this as FieldModel).fallback,
        description: (this as FieldModel).description,
      );
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

/// A record representing a field. Similar to [FieldModel].
typedef TFieldRecord = ({
  List<String>? fieldPath,
  String? fieldType,
  bool? nullable,
  List<Map<String, dynamic>>? children,
  bool? primaryKey,
  bool? foreignKey,
  Object? fallback,
  String? description,
});

extension ToClassOnTFieldRecordExtension on TFieldRecord {
  /// Converts this to a [FieldModel].
  FieldModel get toClass => FieldModel(
        fieldPath: fieldPath,
        fieldType: fieldType,
        nullable: nullable,
        children: children,
        primaryKey: primaryKey,
        foreignKey: foreignKey,
        fallback: fallback,
        description: description,
      );
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

final class FieldUtils {
  FieldUtils();

  /// Assumes [unknown] is a [TFieldRecord] or [FieldModel] and
  /// tries to construct a [FieldModel], otherwise returns `null`.
  static FieldModel? ofOrNull(dynamic unknown) {
    try {
      final fieldPath = fieldPathOrNull(unknown)!;
      final fieldType = fieldTypeOrNull(unknown) ?? 'dynamic';
      final nullable = nullableOrNull(unknown);
      final children = childrenOrNull(unknown); // New method for children
      final primaryKey = primaryKeyOrNull(unknown); // New method for primaryKey
      final foreignKey = foreignKeyOrNull(unknown); // New method for foreignKey
      final fallback = fallbackOrNull(unknown); // New method for fallback
      final description = descriptionOrNull(unknown);
      return FieldModel(
        fieldPath: fieldPath,
        fieldType: fieldType,
        nullable: nullable,
        children: children,
        primaryKey: primaryKey,
        foreignKey: foreignKey,
        fallback: fallback,
        description: description,
      );
    } catch (_) {
      return null; // Return null if any property retrieval fails
    }
  }

  /// Assumes [unknown] is a [TFieldRecord] or [FieldModel] and tries to get
  /// the `fieldPath` property, or returns `null`.
  static List<String>? fieldPathOrNull(dynamic unknown) {
    try {
      return (unknown.fieldPath as List<String>);
    } catch (_) {
      try {
        return unknown.$1 as List<String>;
      } catch (_) {
        return null;
      }
    }
  }

  /// Assumes [unknown] is a [TFieldRecord] or [FieldModel] and tries to get
  /// the `fieldType` property, or returns `null`.
  static String? fieldTypeOrNull(dynamic unknown) {
    try {
      return unknown.fieldType as String;
    } catch (_) {
      try {
        return unknown.$2 as String;
      } catch (e) {
        return null;
      }
    }
  }

  /// Assumes [unknown] is a [TFieldRecord] or [FieldModel] and tries to get
  /// the `nullable` property, or returns `null`.
  static bool? nullableOrNull(dynamic unknown) {
    try {
      return unknown.nullable as bool?;
    } catch (_) {
      try {
        return unknown.$3 as bool?;
      } catch (_) {
        return null;
      }
    }
  }

  /// Assumes [unknown] is a [TFieldRecord] or [FieldModel] and tries to get
  /// the `children` property, or returns `null`.
  static List<Map<String, dynamic>>? childrenOrNull(dynamic unknown) {
    try {
      return (unknown.children as List<Map<String, dynamic>>);
    } catch (_) {
      try {
        return unknown.$4 as List<Map<String, dynamic>>;
      } catch (_) {
        return null;
      }
    }
  }

  /// Assumes [unknown] is a [TFieldRecord] or [FieldModel] and tries to get
  /// the `primaryKey` property, or returns `null`.
  static bool? primaryKeyOrNull(dynamic unknown) {
    try {
      return unknown.primaryKey as bool?;
    } catch (_) {
      try {
        return unknown.$5 as bool?;
      } catch (_) {
        return null;
      }
    }
  }

  /// Assumes [unknown] is a [TFieldRecord] or [FieldModel] and tries to get
  /// the `foreignKey` property, or returns `null`.
  static bool? foreignKeyOrNull(dynamic unknown) {
    try {
      return unknown.foreignKey as bool?;
    } catch (_) {
      try {
        return unknown.$6 as bool?;
      } catch (_) {
        return null;
      }
    }
  }

  /// Assumes [unknown] is a [TFieldRecord] or [FieldModel] and tries to get
  /// the `fallback` property, or returns `null`.
  static Object? fallbackOrNull(dynamic unknown) {
    try {
      return unknown.fallback as Object?;
    } catch (_) {
      try {
        return unknown.$7 as Object?;
      } catch (_) {
        return null;
      }
    }
  }

  /// Assumes [unknown] is a [TFieldRecord] or [FieldModel] and tries to get
  /// the `description` property, or returns `null`.
  static String? descriptionOrNull(dynamic unknown) {
    try {
      return unknown.description as String;
    } catch (_) {
      try {
        return unknown.$8 as String;
      } catch (_) {
        return null;
      }
    }
  }
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

typedef Field = FieldModel;
