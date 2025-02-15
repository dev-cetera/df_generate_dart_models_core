//.title
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//
// GENERATED - DO NOT MODIFY BY HAND
// See: https://github.com/dev-cetera/df_generate_dart_models
//
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//.title~

// ignore_for_file: annotate_overrides
// ignore_for_file: invalid_null_aware_operator
// ignore_for_file: overridden_fields
// ignore_for_file: require_trailing_commas
// ignore_for_file: unnecessary_non_null_assertion
// ignore_for_file: unnecessary_null_comparison
// ignore_for_file: unnecessary_question_mark

part of 'field_model.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

/// Generated class for [_FieldModel].
class FieldModel extends _FieldModel {
  //
  //
  //

  /// The runtime type of this class as a String.
  static const CLASS_NAME = 'FieldModel';

  @override
  String get $className => CLASS_NAME;

  /// The path of the field within the model, represented as a list of strings.
  final List<String>? fieldPath;

  /// The data type of the field, such as "String", "int", or any dynamic type.
  final dynamic? fieldType;

  /// Whether the field can hold a null value.
  final bool? nullable;

  /// Children of this field, allowing for nested fields or complex structures.
  final List<Map<String, dynamic>>? children;

  /// Whether this field serves as a primary key.
  final bool? primaryKey;

  /// Whether this field serves as a foreign key.
  final bool? foreignKey;

  /// The default/fallback value for the field, to use in cases where the value is null.
  final Object? fallback;

  /// A brief comment or explanation for the field's purpose.
  final String? description;

  /// Constructs a new instance of [FieldModel]
  /// from optional and required parameters.
  const FieldModel({
    this.fieldPath,
    required this.fieldType,
    this.nullable,
    this.children,
    this.primaryKey,
    this.foreignKey,
    this.fallback,
    this.description,
  });

  /// Construcs a new instance of [FieldModel],
  /// forcing all parameters to be optional.
  const FieldModel.optional({
    this.fieldPath,
    this.fieldType,
    this.nullable,
    this.children,
    this.primaryKey,
    this.foreignKey,
    this.fallback,
    this.description,
  });

  /// Constructs a new instance of [FieldModel],
  /// and asserts that all required parameters are not null.
  factory FieldModel.assertRequired({
    List<String>? fieldPath,
    dynamic? fieldType,
    bool? nullable,
    List<Map<String, dynamic>>? children,
    bool? primaryKey,
    bool? foreignKey,
    Object? fallback,
    String? description,
  }) {
    assert(fieldType != null);

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
  }

  /// Constructs a new instance of [FieldModel],
  /// from the fields of [another] instance. Throws if the conversion fails.
  factory FieldModel.from(BaseModel another) {
    try {
      return fromOrNull(another)!;
    } catch (e) {
      assert(false, '$FieldModel.from: $e');
      rethrow;
    }
  }

  /// Constructs a new instance of [FieldModel],
  /// from the fields of [another] instance. Returns `null` if [another] is
  /// `null` or if the conversion fails.
  @pragma('vm:prefer-inline')
  static FieldModel? fromOrNull(BaseModel? another) {
    return fromJsonOrNull(another?.toJson())!;
  }

  /// Constructs a new instance of [FieldModel],
  /// from the fields of [another] instance. Throws if the conversion fails.
  factory FieldModel.of(FieldModel another) {
    try {
      return ofOrNull(another)!;
    } catch (e) {
      assert(false, '$FieldModel.of: $e');
      rethrow;
    }
  }

  /// Constructs a new instance of [FieldModel],
  /// from the fields of [another] instance. Returns `null` if [another] is
  /// `null` or if the conversion fails.
  @pragma('vm:prefer-inline')
  static FieldModel? ofOrNull(FieldModel? other) {
    return fromJsonOrNull(other?.toJson());
  }

  /// Constructs a new instance of [FieldModel],
  /// from [jsonString], which must be a valid JSON String. Throws if the
  /// conversion fails.
  factory FieldModel.fromJsonString(String jsonString) {
    try {
      return fromJsonStringOrNull(jsonString)!;
    } catch (e) {
      assert(false, '$FieldModel.fromJsonString: $e');
      rethrow;
    }
  }

  /// Constructs a new instance of [FieldModel],
  /// from [jsonString], which must be a valid JSON String. Returns `null` if
  /// [jsonString] is `null` or if the conversion fails.
  static FieldModel? fromJsonStringOrNull(String? jsonString) {
    try {
      if (jsonString!.isNotEmpty) {
        final decoded = letMapOrNull<String, dynamic>(jsonDecode(jsonString));
        return FieldModel.fromJson(decoded);
      } else {
        return FieldModel.assertRequired();
      }
    } catch (_) {
      return null;
    }
  }

  /// Constructs a new instance of [FieldModel],
  /// from [json], which must be a valid JSON object. Throws if the conversion
  /// fails.
  factory FieldModel.fromJson(Map<String, dynamic>? json) {
    try {
      return fromJsonOrNull(json)!;
    } catch (e) {
      assert(false, '$FieldModel.fromJson: $e');
      rethrow;
    }
  }

  /// Constructs a new instance of [FieldModel],
  /// from [json], which must be a valid JSON object. Returns `null` if
  /// [json] is `null` or if the conversion fails.
  static FieldModel? fromJsonOrNull(Map<String, dynamic>? json) {
    try {
      final fieldPath =
          letListOrNull<dynamic>(json?['fieldPath'])
              ?.map((p0) => p0?.toString().trim().nullIfEmpty)
              .nonNulls
              .nullIfEmpty
              ?.toList()
              .unmodifiable;
      final fieldType = json?['fieldType'];
      final nullable = letAsOrNull<bool>(json?['nullable']);
      final children =
          letListOrNull<dynamic>(json?['children'])
              ?.map(
                (p0) =>
                    letMapOrNull<dynamic, dynamic>(p0)
                        ?.map(
                          (p0, p1) =>
                              MapEntry(p0?.toString().trim().nullIfEmpty, p1),
                        )
                        .nonNulls
                        .nullIfEmpty
                        ?.unmodifiable,
              )
              .nonNulls
              .nullIfEmpty
              ?.toList()
              .unmodifiable;
      final primaryKey = letAsOrNull<bool>(json?['primaryKey']);
      final foreignKey = letAsOrNull<bool>(json?['foreignKey']);
      final fallback = json?['fallback'];
      final description = json?['description']?.toString().trim().nullIfEmpty;
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
    } catch (e) {
      return null;
    }
  }

  /// Constructs a new instance of [FieldModel],
  /// from the query parameters of [uri]. Throws if the conversion
  /// fails.
  factory FieldModel.fromUri(Uri? uri) {
    try {
      return fromUriOrNull(uri)!;
    } catch (e) {
      assert(false, '$FieldModel.fromUri: $e');
      rethrow;
    }
  }

  /// Constructs a new instance of [FieldModel],
  /// from the query parameters of [uri]. Returns `null` if [uri] is `null` or
  /// if the conversion fails.
  static FieldModel? fromUriOrNull(Uri? uri) {
    try {
      if (uri != null && uri.path == CLASS_NAME) {
        return FieldModel.fromJson(uri.queryParameters);
      } else {
        return FieldModel.assertRequired();
      }
    } catch (_) {
      return null;
    }
  }

  @override
  Map<String, dynamic> toJson({bool includeNulls = false}) {
    try {
      final fieldPath0 =
          fieldPath
              ?.map((p0) => p0?.trim().nullIfEmpty)
              .nonNulls
              .nullIfEmpty
              ?.toList();
      final fieldType0 = fieldType;
      final nullable0 = nullable;
      final children0 =
          children
              ?.map(
                (p0) =>
                    p0
                        ?.map((p0, p1) => MapEntry(p0?.trim().nullIfEmpty, p1))
                        .nonNulls
                        .nullIfEmpty,
              )
              .nonNulls
              .nullIfEmpty
              ?.toList();
      final primaryKey0 = primaryKey;
      final foreignKey0 = foreignKey;
      final fallback0 = fallback;
      final description0 = description?.trim().nullIfEmpty;
      final withNulls = {
        'primaryKey': primaryKey0,
        'nullable': nullable0,
        'foreignKey': foreignKey0,
        'fieldType': fieldType0,
        'fieldPath': fieldPath0,
        'fallback': fallback0,
        'description': description0,
        'children': children0,
      };
      return includeNulls ? withNulls : withNulls.nonNulls;
    } catch (e) {
      assert(false, '$FieldModel.toJson: $e');
      rethrow;
    }
  }

  /// Returns the value of the [fieldPath] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
  @pragma('vm:prefer-inline')
  List<String>? get fieldPath$ => fieldPath;

  /// Returns the value of the [fieldType] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
  @pragma('vm:prefer-inline')
  dynamic get fieldType$ => fieldType!;

  /// Returns the value of the [nullable] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
  @pragma('vm:prefer-inline')
  bool? get nullable$ => nullable;

  /// Returns the value of the [children] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
  @pragma('vm:prefer-inline')
  List<Map<String, dynamic>>? get children$ => children;

  /// Returns the value of the [primaryKey] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
  @pragma('vm:prefer-inline')
  bool? get primaryKey$ => primaryKey;

  /// Returns the value of the [foreignKey] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
  @pragma('vm:prefer-inline')
  bool? get foreignKey$ => foreignKey;

  /// Returns the value of the [fallback] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
  @pragma('vm:prefer-inline')
  Object? get fallback$ => fallback;

  /// Returns the value of the [description] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
  @pragma('vm:prefer-inline')
  String? get description$ => description;
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

abstract final class FieldModelFieldNames {
  /// The field name of [FieldModel.fieldPath].
  static const fieldPath = 'fieldPath';

  /// The field name of [FieldModel.fieldType].
  static const fieldType = 'fieldType';

  /// The field name of [FieldModel.nullable].
  static const nullable = 'nullable';

  /// The field name of [FieldModel.children].
  static const children = 'children';

  /// The field name of [FieldModel.primaryKey].
  static const primaryKey = 'primaryKey';

  /// The field name of [FieldModel.foreignKey].
  static const foreignKey = 'foreignKey';

  /// The field name of [FieldModel.fallback].
  static const fallback = 'fallback';

  /// The field name of [FieldModel.description].
  static const description = 'description';
}

extension FieldModelX on FieldModel {
  /// Creates a copy of this instance, merging another model's fields into
  /// this model's fields.
  FieldModel mergeWith(BaseModel? other, {bool deepMerge = false}) {
    final a = toJson();
    final b = other?.toJson() ?? {};
    final data = (deepMerge ? mergeDataDeep(a, b) : {...a, ...b}) as Map;
    return FieldModel.fromJson(data.cast());
  }

  /// Creates a copy of this instance, replacing the specified fields.
  FieldModel copyWith({
    List<String>? fieldPath,
    dynamic? fieldType,
    bool? nullable,
    List<Map<String, dynamic>>? children,
    bool? primaryKey,
    bool? foreignKey,
    Object? fallback,
    String? description,
  }) {
    return FieldModel.assertRequired(
      fieldPath: fieldPath ?? this.fieldPath,
      fieldType: fieldType ?? this.fieldType,
      nullable: nullable ?? this.nullable,
      children: children ?? this.children,
      primaryKey: primaryKey ?? this.primaryKey,
      foreignKey: foreignKey ?? this.foreignKey,
      fallback: fallback ?? this.fallback,
      description: description ?? this.description,
    );
  }

  /// Creates a copy of this instance, removing the specified fields.
  FieldModel copyWithout({
    bool fieldPath = true,
    bool fieldType = true,
    bool nullable = true,
    bool children = true,
    bool primaryKey = true,
    bool foreignKey = true,
    bool fallback = true,
    bool description = true,
  }) {
    return FieldModel.assertRequired(
      fieldPath: fieldPath ? this.fieldPath : null,
      fieldType: fieldType ? this.fieldType : null,
      nullable: nullable ? this.nullable : null,
      children: children ? this.children : null,
      primaryKey: primaryKey ? this.primaryKey : null,
      foreignKey: foreignKey ? this.foreignKey : null,
      fallback: fallback ? this.fallback : null,
      description: description ? this.description : null,
    );
  }
}
