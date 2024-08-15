//.title
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//
// Dart/Flutter (DF) Packages by DevCetra.com & contributors. Use of this
// source code is governed by an MIT-style license that can be found in the
// LICENSE file.
//
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//.title~

import '/df_generate_dart_models_core.dart';

part '_field_model.g.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

@GenerateDartModel(
  shouldInherit: true,
  fields: {
    /// The name of the field.
    ('fieldPath?', List<String>),

    /// The type of the field, e.g. 'String'.
    ('fieldType?', dynamic),

    /// Whether [fieldType] is nullable or not.
    ('nullable?', bool),

    ('child?', FieldModel),
  },
)

/// Represents a field, its name, type, and its nullability. Similar to
/// [TFieldRecord].
abstract class _FieldModel extends BaseModel {
  const _FieldModel();

  /// The type code of the field (the type with any special, characters, such
  /// as 'String?').
  String? get fieldTypeCode => (this as FieldModel).fieldType;

  /// Converts this to a [TFieldRecord].
  TFieldRecord get toRecord => (
        fieldPath: (this as FieldModel).fieldPath,
        fieldType: (this as FieldModel).fieldType,
        nullable: (this as FieldModel).nullable,
      );
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

/// A record representing a field. Similar to [FieldModel].
typedef TFieldRecord = ({
  List<String>? fieldPath,
  String? fieldType,
  bool? nullable,
});

extension ToClassOnTFieldRecordExtension on TFieldRecord {
  /// Converts this to a [FieldModel].
  FieldModel get toClass => FieldModel(
        fieldPath: fieldPath,
        fieldType: fieldType,
        nullable: nullable,
      );
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

final class FieldUtils {
  FieldUtils();

  /// Assumes [unknown] is a [TFieldRecord] or [FieldModel] or similar and
  /// tries to construct a [FieldModel], otherwise returns `null`.
  static FieldModel? ofOrNull(dynamic unknown) {
    try {
      final fieldPath = fieldPathOrNull(unknown)!;
      final fieldType = fieldTypeOrNull(unknown) ?? 'dynamic';
      final nullable = nullableOrNull(unknown);
      return FieldModel(
        fieldPath: fieldPath,
        fieldType: fieldType,
        nullable: nullable,
      );
    } catch (_) {
      return null;
    }
  }

  /// Assumes [unknown] is a [TFieldRecord] or [FieldModel] or similar and
  /// tries to get the [fieldPath] property, or returns `null`.
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

  /// Assumes [unknown] is a [TFieldRecord] or [FieldModel] or similar and
  /// tries to get the [fieldType] property, or returns `null`.
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

  /// Assumes [unknown] is a [TFieldRecord] or [FieldModel] or similar and
  /// tries to get the [nullable] property, or returns `null`.
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
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

typedef Field = FieldModel;
