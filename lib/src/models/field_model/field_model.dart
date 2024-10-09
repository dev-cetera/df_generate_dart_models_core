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

import '/df_generate_dart_models_core.dart';

part '_field_model.g.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

@GenerateDartModel(
  shouldInherit: true,
  fields: {
    Field(
      fieldPath: ['fieldPath'],
      fieldType: List<String>,
      nullable: true,
      description:
          'The path of the field within the model, represented as a list of strings.',
    ),
    Field(
      fieldPath: ['fieldType'],
      fieldType: dynamic,
      nullable: true,
      description:
          'The data type of the field, such as "String", "int", or any dynamic type.',
    ),
    Field(
      fieldPath: ['nullable'],
      fieldType: bool,
      nullable: true,
      description: 'Whether the field can hold a null value.',
    ),
    Field(
      fieldPath: ['children'],
      fieldType: List<FieldModel>,
      nullable: true,
      description:
          '[Unimplemented] Children of this field, allowing for nested fields or complex structures.',
    ),
    Field(
      fieldPath: ['primary'],
      fieldType: bool,
      nullable: true,
      description:
          '[Unimplemented] Whether this field serves as a primary identifier, typically in database contexts.',
    ),
    Field(
      fieldPath: ['fallback'],
      fieldType: Object,
      nullable: true,
      description:
          '[Unimplemented] The default/fallback value for the field, to use in cases where the value is null',
    ),
    Field(
      fieldPath: ['description'],
      fieldType: String,
      nullable: true,
      description: "A brief comment or explanation for the field's purpose.",
    ),
  },
)

/// Represents a field, its name, type, and its nullability. Similar to
/// [TFieldRecord].
abstract class _FieldModel extends BaseModel {
  const _FieldModel();

  /// The type code of the field (the type with any special, characters, such
  /// as 'String?').
  String? get fieldTypeCode => (this as FieldModel).fieldType.toString();

  /// Converts this to a [TFieldRecord].
  TFieldRecord get toRecord => (
        fieldPath: (this as FieldModel).fieldPath,
        fieldType: (this as FieldModel).fieldType,
        nullable: (this as FieldModel).nullable,
        description: (this as FieldModel).description,
      );
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

/// A record representing a field. Similar to [FieldModel].
typedef TFieldRecord = ({
  List<String>? fieldPath,
  String? fieldType,
  bool? nullable,
  String? description,
});

extension ToClassOnTFieldRecordExtension on TFieldRecord {
  /// Converts this to a [FieldModel].
  FieldModel get toClass => FieldModel(
        fieldPath: fieldPath,
        fieldType: fieldType,
        nullable: nullable,
        description: description,
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
      final description = descriptionOrNull(unknown);
      return FieldModel(
        fieldPath: fieldPath,
        fieldType: fieldType,
        nullable: nullable,
        description: description,
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

  /// Assumes [unknown] is a [TFieldRecord] or [FieldModel] or similar and
  /// tries to get the [description] property, or returns `null`.
  static String? descriptionOrNull(dynamic unknown) {
    try {
      return unknown.description as String;
    } catch (_) {
      try {
        return unknown.$4 as String;
      } catch (_) {
        return null;
      }
    }
  }
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

typedef Field = FieldModel;
