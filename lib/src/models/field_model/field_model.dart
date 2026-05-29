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
    fieldType: List<Map<String, dynamic>>,
    nullable: true,
    description:
        'Children of this field, allowing for nested fields or complex structures.',
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
  Field(
    fieldPath: ['references'],
    fieldType: Object,
    nullable: true,
    description:
        'The target model class this field references. Implies foreignKey. '
        'Resolves to the target model\'s primary key column by default; '
        'override via [referencesColumn].',
  ),
  Field(
    fieldPath: ['referencesColumn'],
    fieldType: String,
    nullable: true,
    description:
        'Optional override naming the target column of the referenced model. '
        "Defaults to the referenced model's primary key column.",
  ),
  Field(
    fieldPath: ['unique'],
    fieldType: bool,
    nullable: true,
    description:
        'Whether this field carries a UNIQUE constraint at the schema level. '
        'Distinct from primaryKey, which is implicitly unique.',
  ),
  Field(
    fieldPath: ['onDelete'],
    fieldType: String,
    nullable: true,
    description:
        "Cascade behaviour for foreign-key deletions: 'cascade', 'restrict', "
        "'set null', or 'no action'. Drives DDL emission; ignored at runtime.",
  ),
  Field(
    fieldPath: ['sqlType'],
    fieldType: String,
    nullable: true,
    description:
        "Explicit SQL column type override (e.g. 'varchar(255)', "
        "'numeric(10,2)', 'citext'). When absent, defaults are derived from "
        'the Dart fieldType and any PG_/SQLITE_ prefix.',
  ),
  Field(
    fieldPath: ['unknownEnumValue'],
    fieldType: Object,
    nullable: true,
    description:
        'Fallback enum value to use when a wire-supplied name does not match '
        'any enum constant. Wraps the generated `XxxType.values.valueOf(...)` '
        'in a `?? <unknownEnumValue>` expression.',
  ),
  Field(
    fieldPath: ['includeInJson'],
    fieldType: bool,
    nullable: true,
    description:
        'When false, the field is omitted from toJson() output and ignored '
        'on fromJson() input. Defaults to true.',
  ),
  Field(
    fieldPath: ['includeInSqlMap'],
    fieldType: bool,
    nullable: true,
    description:
        'When false, the field is omitted from toSqlMap() output. Useful for '
        'fields that exist on the wire but never in the database, or vice '
        'versa. Defaults to true.',
  ),
  Field(
    fieldPath: ['includeInFirestoreMap'],
    fieldType: bool,
    nullable: true,
    description:
        'When false, the field is omitted from toFirestoreMap() output. '
        'Defaults to true.',
  ),
  Field(
    fieldPath: ['converter'],
    fieldType: Object,
    nullable: true,
    description:
        'Custom JsonConverter-style class for this field. When set, '
        '`ConverterClass().fromJson(value)` / `.toJson(value)` is emitted '
        'instead of the dialect-driven mapper. Bypass for types the '
        'generator does not natively understand.',
  ),
};

@GenerateDartModel(
  shouldInherit: true,
  fields: FIELD_MODEL_FIELDS,
  // Off because every `@GenerateDartModel(fields: {Field(...), ...})`
  // annotation puts `Field` (= `FieldModel`) instances inside a const Set, and
  // const set elements may not override `==` / `hashCode`.
  equatable: false,
)

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
        references: (this as FieldModel).references,
        referencesColumn: (this as FieldModel).referencesColumn,
        unique: (this as FieldModel).unique,
        onDelete: (this as FieldModel).onDelete,
        sqlType: (this as FieldModel).sqlType,
        unknownEnumValue: (this as FieldModel).unknownEnumValue,
        includeInJson: (this as FieldModel).includeInJson,
        includeInSqlMap: (this as FieldModel).includeInSqlMap,
        includeInFirestoreMap: (this as FieldModel).includeInFirestoreMap,
        converter: (this as FieldModel).converter,
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
  Object? references,
  String? referencesColumn,
  bool? unique,
  String? onDelete,
  String? sqlType,
  Object? unknownEnumValue,
  bool? includeInJson,
  bool? includeInSqlMap,
  bool? includeInFirestoreMap,
  Object? converter,
});

extension ToClassOnTFieldRecordExtension on TFieldRecord {
  /// Converts this to a [FieldModel].
  FieldModel get toClass => FieldModel(
        fieldPath: this.fieldPath,
        fieldType: this.fieldType,
        nullable: this.nullable,
        children: this.children,
        primaryKey: this.primaryKey,
        foreignKey: this.foreignKey,
        fallback: this.fallback,
        description: this.description,
        references: this.references,
        referencesColumn: this.referencesColumn,
        unique: this.unique,
        onDelete: this.onDelete,
        sqlType: this.sqlType,
        unknownEnumValue: this.unknownEnumValue,
        includeInJson: this.includeInJson,
        includeInSqlMap: this.includeInSqlMap,
        includeInFirestoreMap: this.includeInFirestoreMap,
        converter: this.converter,
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
      final children = childrenOrNull(unknown);
      final primaryKey = primaryKeyOrNull(unknown);
      final foreignKey = foreignKeyOrNull(unknown);
      final fallback = fallbackOrNull(unknown);
      final description = descriptionOrNull(unknown);
      final references = referencesOrNull(unknown);
      final referencesColumn = referencesColumnOrNull(unknown);
      final unique = uniqueOrNull(unknown);
      final onDelete = onDeleteOrNull(unknown);
      final sqlType = sqlTypeOrNull(unknown);
      final unknownEnumValue = unknownEnumValueOrNull(unknown);
      final includeInJson = includeInJsonOrNull(unknown);
      final includeInSqlMap = includeInSqlMapOrNull(unknown);
      final includeInFirestoreMap = includeInFirestoreMapOrNull(unknown);
      final converter = converterOrNull(unknown);
      return FieldModel(
        fieldPath: fieldPath,
        fieldType: fieldType,
        nullable: nullable,
        children: children,
        primaryKey: primaryKey,
        foreignKey: foreignKey,
        fallback: fallback,
        description: description,
        references: references,
        referencesColumn: referencesColumn,
        unique: unique,
        onDelete: onDelete,
        sqlType: sqlType,
        unknownEnumValue: unknownEnumValue,
        includeInJson: includeInJson,
        includeInSqlMap: includeInSqlMap,
        includeInFirestoreMap: includeInFirestoreMap,
        converter: converter,
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
  ///
  /// [FieldModel.fieldType] is declared `dynamic` because it can be assigned
  /// a [Type] literal (e.g. `fieldType: String`) directly. The direct
  /// `as String` cast would throw for non-String values, so we fall back to
  /// `.toString()` — which on a `Type` returns the type's display name.
  static String? fieldTypeOrNull(dynamic unknown) {
    try {
      final raw = unknown.fieldType;
      if (raw == null) return null;
      if (raw is String) return raw;
      return raw.toString();
    } catch (_) {
      try {
        final raw = unknown.$2;
        if (raw == null) return null;
        if (raw is String) return raw;
        return raw.toString();
      } catch (_) {
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

  /// Assumes [unknown] is a [TFieldRecord] or [FieldModel] and tries to get
  /// the `references` property, or returns `null`. The value is typically a
  /// Type literal (e.g. `references: ModelUser`); the generator resolves it
  /// to the target model at codegen time.
  static Object? referencesOrNull(dynamic unknown) {
    try {
      return unknown.references as Object?;
    } catch (_) {
      try {
        return unknown.$9 as Object?;
      } catch (_) {
        return null;
      }
    }
  }

  /// Assumes [unknown] is a [TFieldRecord] or [FieldModel] and tries to get
  /// the `referencesColumn` property, or returns `null`.
  static String? referencesColumnOrNull(dynamic unknown) {
    try {
      return unknown.referencesColumn as String?;
    } catch (_) {
      try {
        return unknown.$10 as String?;
      } catch (_) {
        return null;
      }
    }
  }

  /// Assumes [unknown] is a [TFieldRecord] or [FieldModel] and tries to get
  /// the `unique` property, or returns `null`.
  static bool? uniqueOrNull(dynamic unknown) {
    try {
      return unknown.unique as bool?;
    } catch (_) {
      try {
        return unknown.$11 as bool?;
      } catch (_) {
        return null;
      }
    }
  }

  /// Assumes [unknown] is a [TFieldRecord] or [FieldModel] and tries to get
  /// the `onDelete` property, or returns `null`.
  static String? onDeleteOrNull(dynamic unknown) {
    try {
      return unknown.onDelete as String?;
    } catch (_) {
      try {
        return unknown.$12 as String?;
      } catch (_) {
        return null;
      }
    }
  }

  /// Assumes [unknown] is a [TFieldRecord] or [FieldModel] and tries to get
  /// the `sqlType` property, or returns `null`.
  static String? sqlTypeOrNull(dynamic unknown) {
    try {
      return unknown.sqlType as String?;
    } catch (_) {
      try {
        return unknown.$13 as String?;
      } catch (_) {
        return null;
      }
    }
  }

  /// Reads the `unknownEnumValue` slot, or `null`.
  static Object? unknownEnumValueOrNull(dynamic unknown) {
    try {
      return unknown.unknownEnumValue as Object?;
    } catch (_) {
      try {
        return unknown.$14 as Object?;
      } catch (_) {
        return null;
      }
    }
  }

  /// Reads the `includeInJson` slot, or `null`.
  static bool? includeInJsonOrNull(dynamic unknown) {
    try {
      return unknown.includeInJson as bool?;
    } catch (_) {
      try {
        return unknown.$15 as bool?;
      } catch (_) {
        return null;
      }
    }
  }

  /// Reads the `includeInSqlMap` slot, or `null`.
  static bool? includeInSqlMapOrNull(dynamic unknown) {
    try {
      return unknown.includeInSqlMap as bool?;
    } catch (_) {
      try {
        return unknown.$16 as bool?;
      } catch (_) {
        return null;
      }
    }
  }

  /// Reads the `includeInFirestoreMap` slot, or `null`.
  static bool? includeInFirestoreMapOrNull(dynamic unknown) {
    try {
      return unknown.includeInFirestoreMap as bool?;
    } catch (_) {
      try {
        return unknown.$17 as bool?;
      } catch (_) {
        return null;
      }
    }
  }

  /// Reads the `converter` slot, or `null`. Like `references`, the value is
  /// typically a Type literal; the analyzer side captures it as a display
  /// name String for use in generated code.
  static Object? converterOrNull(dynamic unknown) {
    try {
      return unknown.converter as Object?;
    } catch (_) {
      try {
        return unknown.$18 as Object?;
      } catch (_) {
        return null;
      }
    }
  }
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

typedef Field = FieldModel;
