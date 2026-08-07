//.title
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//
// GENERATED - DO NOT MODIFY BY HAND
// See: https://github.com/dev-cetera/df_generate_dart_models
//
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//.title~

// ignore_for_file: annotate_overrides
// ignore_for_file: argument_type_not_assignable
// ignore_for_file: invalid_null_aware_operator
// ignore_for_file: overridden_fields
// ignore_for_file: require_trailing_commas
// ignore_for_file: unnecessary_non_null_assertion
// ignore_for_file: unnecessary_null_comparison
// ignore_for_file: unnecessary_question_mark

part of 'generate_dart_model.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

/// Generated class for [_GenerateDartModel].
class GenerateDartModel extends _GenerateDartModel with EquatableMixin {
  //
  //
  //

  /// The runtime type of this class as a String.
  static const CLASS_NAME = 'GenerateDartModel';

  @override
  String get $className => CLASS_NAME;

  /// The database table name this model maps to, mirroring `tableName:` on
  /// the annotation. When the annotation omits `tableName:`, this is derived
  /// from the class name (Model prefix/suffix stripped, snake-cased) — no
  /// automatic pluralisation. The `$` prefix matches the convention used by
  /// the other framework-reserved statics (`$className`, `$primaryKey`,
  /// `$foreignKeys`, `$values`) and prevents collisions with user columns
  /// named `table_name` / `tableName`.
  static const $tableName = 'generate_dart';

  /// Field list backing `==` and `hashCode` via [EquatableMixin]. Preserves
  /// the same value semantics across hand-construction and `fromJson`
  /// round-trips since every field is included.
  @override
  List<Object?> get props => [
        className,
        fields,
        shouldInherit,
        inheritanceConstructor,
        keyStringCase,
        description,
        tableName,
        schema,
        indexes
      ];

  /// Preserves [BaseModel]'s JSON pretty-print toString rather than letting
  /// [EquatableMixin]'s default toString shadow it. The mixin sits after
  /// the BaseModel chain in the linearization, so we re-override here.
  @override
  String toString() => toJsonString();

  /// The class name to be used. If left null, the name is derived from the annotated class.
  final String? className;

  /// A collection of fields, represented as [Field] instances, to be generated for the class.
  final Set<dynamic>? fields;

  /// Determines whether the annotated class should be inherited by the generated class.
  final bool? shouldInherit;

  /// The constructor from the superclass to use, if a custom one is required.
  final String? inheritanceConstructor;

  /// Specifies the case format for the keys, with "CAMEL_CASE" as the default.
  final String? keyStringCase;

  /// A comment describing the generated class.
  final String? description;

  /// Database table name this model maps to. Consumed by the DBML generator (and any tool that emits a wire-level table name). When null, the table name is derived from the class name (Model prefix stripped, snake-cased) — no automatic pluralisation.
  final String? tableName;

  /// Database schema this model belongs to. Acts as the DBML emission gate — models without a schema are skipped, and emitted tables are grouped into one DBML file per distinct schema value. Pass a project-wide const (e.g. `MY_APP_SCHEMA`) so the schema name has a single source of truth.
  final String? schema;

  /// Table indexes emitted by the DBML generator as an `indexes { ... }` block. Each entry is a map: {'columns': ['a', 'b'], 'unique': true, 'name': 'idx_name', 'note': '...'}. A single-column index may pass 'columns': ['a']. Consumed by the DBML emitter only; it does not affect the generated Dart model.
  final List<Map<String, dynamic>>? indexes;

  /// Constructs a new instance of [GenerateDartModel]
  /// from optional and required parameters.
  const GenerateDartModel({
    this.className,
    this.fields,
    this.shouldInherit,
    this.inheritanceConstructor,
    this.keyStringCase,
    this.description,
    this.tableName,
    this.schema,
    this.indexes,
  });

  /// Construcs a new instance of [GenerateDartModel],
  /// forcing all parameters to be optional.
  const GenerateDartModel.optional({
    this.className,
    this.fields,
    this.shouldInherit,
    this.inheritanceConstructor,
    this.keyStringCase,
    this.description,
    this.tableName,
    this.schema,
    this.indexes,
  });

  /// Constructs a new instance of [GenerateDartModel],
  /// and asserts that all required parameters are not null.
  factory GenerateDartModel.assertRequired({
    String? className,
    Set<dynamic>? fields,
    bool? shouldInherit,
    String? inheritanceConstructor,
    String? keyStringCase,
    String? description,
    String? tableName,
    String? schema,
    List<Map<String, dynamic>>? indexes,
  }) {
    return GenerateDartModel(
      className: className,
      fields: fields,
      shouldInherit: shouldInherit,
      inheritanceConstructor: inheritanceConstructor,
      keyStringCase: keyStringCase,
      description: description,
      tableName: tableName,
      schema: schema,
      indexes: indexes,
    );
  }

  /// Constructs a new instance of [GenerateDartModel],
  /// from the fields of [another] instance. Throws if the conversion fails.
  factory GenerateDartModel.from(
    BaseModel another,
  ) {
    try {
      return fromOrNull(another)!;
    } catch (e) {
      assert(false, '$GenerateDartModel.from: $e');
      rethrow;
    }
  }

  /// Constructs a new instance of [GenerateDartModel],
  /// from the fields of [another] instance. Returns `null` if [another] is
  /// `null` or if the conversion fails.
  @pragma('vm:prefer-inline')
  static GenerateDartModel? fromOrNull(
    BaseModel? another,
  ) {
    if (another == null) return null;
    return fromJsonOrNull(another.toJson());
  }

  /// Constructs a new instance of [GenerateDartModel],
  /// from the fields of [another] instance. Throws if the conversion fails.
  factory GenerateDartModel.of(
    GenerateDartModel another,
  ) {
    try {
      return ofOrNull(another)!;
    } catch (e) {
      assert(false, '$GenerateDartModel.of: $e');
      rethrow;
    }
  }

  /// Constructs a new instance of [GenerateDartModel],
  /// from the fields of [another] instance. Returns `null` if [another] is
  /// `null` or if the conversion fails.
  @pragma('vm:prefer-inline')
  static GenerateDartModel? ofOrNull(
    GenerateDartModel? other,
  ) {
    return fromJsonOrNull(other?.toJson());
  }

  /// Constructs a new instance of [GenerateDartModel],
  /// from [jsonString], which must be a valid JSON String. Throws if the
  /// conversion fails.
  factory GenerateDartModel.fromJsonString(
    String jsonString,
  ) {
    try {
      return fromJsonStringOrNull(jsonString)!;
    } catch (e) {
      assert(false, '$GenerateDartModel.fromJsonString: $e');
      rethrow;
    }
  }

  /// Constructs a new instance of [GenerateDartModel],
  /// from [jsonString], which must be a valid JSON String. Returns `null` if
  /// [jsonString] is `null` or if the conversion fails.
  static GenerateDartModel? fromJsonStringOrNull(
    String? jsonString,
  ) {
    if (jsonString == null || jsonString.isEmpty) return null;
    try {
      final decoded = letMapOrNull<String, dynamic>(jsonDecode(jsonString));
      return GenerateDartModel.fromJsonOrNull(decoded);
    } catch (_) {
      return null;
    }
  }

  /// Constructs a new instance of [GenerateDartModel],
  /// from [json], which must be a valid JSON object. Throws if the conversion
  /// fails.
  factory GenerateDartModel.fromJson(
    Map<String, dynamic>? json,
  ) {
    try {
      return fromJsonOrNull(json)!;
    } catch (e) {
      assert(false, '$GenerateDartModel.fromJson: $e');
      rethrow;
    }
  }

  /// Constructs a new instance of [GenerateDartModel],
  /// from [json], which must be a valid JSON object. Returns `null` if
  /// [json] is `null` or if the conversion fails.
  static GenerateDartModel? fromJsonOrNull(
    Map<String, dynamic>? json,
  ) {
    try {
      final className = json?['className']?.toString().trim().nullIfEmpty;
      final fields = letSetOrNull<dynamic>(json?['fields'])
          ?.map(
            (p0) => p0,
          )
          .nonNulls
          .nullIfEmpty
          ?.toSet()
          .unmodifiable;
      final shouldInherit = letBoolOrNull(json?['shouldInherit']);
      final inheritanceConstructor =
          json?['inheritanceConstructor']?.toString().trim().nullIfEmpty;
      final keyStringCase =
          json?['keyStringCase']?.toString().trim().nullIfEmpty;
      final description = json?['description']?.toString().trim().nullIfEmpty;
      final tableName = json?['tableName']?.toString().trim().nullIfEmpty;
      final schema = json?['schema']?.toString().trim().nullIfEmpty;
      final indexes = letListOrNull<dynamic>(json?['indexes'])
          ?.map(
            (p0) => letMapOrNull<dynamic, dynamic>(p0)
                ?.map(
                  (p0, p1) => MapEntry(
                    p0?.toString().trim().nullIfEmpty,
                    p1,
                  ),
                )
                .nonNulls
                .nullIfEmpty
                ?.unmodifiable,
          )
          .nonNulls
          .nullIfEmpty
          ?.toList()
          .unmodifiable;
      return GenerateDartModel(
        className: className,
        fields: fields,
        shouldInherit: shouldInherit,
        inheritanceConstructor: inheritanceConstructor,
        keyStringCase: keyStringCase,
        description: description,
        tableName: tableName,
        schema: schema,
        indexes: indexes,
      );
    } catch (e) {
      return null;
    }
  }

  /// Constructs a new instance of [GenerateDartModel],
  /// from the query parameters of [uri]. Throws if the conversion
  /// fails.
  factory GenerateDartModel.fromUri(
    Uri? uri,
  ) {
    try {
      return fromUriOrNull(uri)!;
    } catch (e) {
      assert(false, '$GenerateDartModel.fromUri: $e');
      rethrow;
    }
  }

  /// Constructs a new instance of [GenerateDartModel],
  /// from the query parameters of [uri]. Returns `null` if [uri] is `null` or
  /// if the conversion fails.
  static GenerateDartModel? fromUriOrNull(
    Uri? uri,
  ) {
    if (uri == null || uri.path != CLASS_NAME) return null;
    try {
      return GenerateDartModel.fromJsonOrNull(uri.queryParameters);
    } catch (_) {
      return null;
    }
  }

  @override
  Map<String, dynamic> toJson({
    bool includeNulls = false,
  }) {
    try {
      final className0 = className?.trim().nullIfEmpty;
      final fields0 = fields
          ?.map(
            (p0) => p0,
          )
          .nonNulls
          .nullIfEmpty
          ?.toList();
      final shouldInherit0 = shouldInherit;
      final inheritanceConstructor0 =
          inheritanceConstructor?.trim().nullIfEmpty;
      final keyStringCase0 = keyStringCase?.trim().nullIfEmpty;
      final description0 = description?.trim().nullIfEmpty;
      final tableName0 = tableName?.trim().nullIfEmpty;
      final schema0 = schema?.trim().nullIfEmpty;
      final indexes0 = indexes
          ?.map(
            (p0) => p0
                ?.map(
                  (p0, p1) => MapEntry(
                    p0?.trim().nullIfEmpty,
                    p1,
                  ),
                )
                .nonNulls
                .nullIfEmpty,
          )
          .nonNulls
          .nullIfEmpty
          ?.toList();
      final withNulls = {
        'tableName': tableName0,
        'shouldInherit': shouldInherit0,
        'schema': schema0,
        'keyStringCase': keyStringCase0,
        'inheritanceConstructor': inheritanceConstructor0,
        'indexes': indexes0,
        'fields': fields0,
        'description': description0,
        'className': className0,
      };
      return includeNulls ? withNulls : withNulls.nonNulls;
    } catch (e) {
      assert(false, '$GenerateDartModel.toJson: $e');
      rethrow;
    }
  }

  /// Returns the value of the [className] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
  @pragma('vm:prefer-inline')
  String? get className$ => className;

  /// Returns the value of the [fields] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
  @pragma('vm:prefer-inline')
  Set<dynamic>? get fields$ => fields;

  /// Returns the value of the [shouldInherit] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
  @pragma('vm:prefer-inline')
  bool? get shouldInherit$ => shouldInherit;

  /// Returns the value of the [inheritanceConstructor] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
  @pragma('vm:prefer-inline')
  String? get inheritanceConstructor$ => inheritanceConstructor;

  /// Returns the value of the [keyStringCase] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
  @pragma('vm:prefer-inline')
  String? get keyStringCase$ => keyStringCase;

  /// Returns the value of the [description] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
  @pragma('vm:prefer-inline')
  String? get description$ => description;

  /// Returns the value of the [tableName] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
  @pragma('vm:prefer-inline')
  String? get tableName$ => tableName;

  /// Returns the value of the [schema] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
  @pragma('vm:prefer-inline')
  String? get schema$ => schema;

  /// Returns the value of the [indexes] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
  @pragma('vm:prefer-inline')
  List<Map<String, dynamic>>? get indexes$ => indexes;
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

abstract final class GenerateDartModelFieldNames {
  /// The field name of [GenerateDartModel.className].
  static const className = 'className';

  /// The field name of [GenerateDartModel.fields].
  static const fields = 'fields';

  /// The field name of [GenerateDartModel.shouldInherit].
  static const shouldInherit = 'shouldInherit';

  /// The field name of [GenerateDartModel.inheritanceConstructor].
  static const inheritanceConstructor = 'inheritanceConstructor';

  /// The field name of [GenerateDartModel.keyStringCase].
  static const keyStringCase = 'keyStringCase';

  /// The field name of [GenerateDartModel.description].
  static const description = 'description';

  /// The field name of [GenerateDartModel.tableName].
  static const tableName = 'tableName';

  /// The field name of [GenerateDartModel.schema].
  static const schema = 'schema';

  /// The field name of [GenerateDartModel.indexes].
  static const indexes = 'indexes';

  /// Every declared field-name constant in declaration order. Mirrors
  /// `enum.values` so consumers can iterate the schema without reflection.
  static const List<String> $values = [
    className,
    fields,
    shouldInherit,
    inheritanceConstructor,
    keyStringCase,
    description,
    tableName,
    schema,
    indexes
  ];

  /// The field marked `primaryKey: true`, or `null` if none was declared.
  static const String? $primaryKey = null;

  /// Foreign-key fields mapped to the referenced class name (as a String).
  /// Empty when no field uses `foreignKey:` / `references:`.
  static const Map<String, String> $foreignKeys = {};
}

extension GenerateDartModelX on GenerateDartModel {
  /// Creates a copy of this instance, merging another model's fields into
  /// this model's fields.
  GenerateDartModel mergeWith(
    BaseModel? other, {
    bool deepMerge = false,
  }) {
    final a = toJson();
    final b = other?.toJson() ?? {};
    final data = (deepMerge ? mergeDataDeep(a, b) : {...a, ...b}) as Map;
    return GenerateDartModel.fromJson(data.cast());
  }

  /// Creates a copy of this instance, replacing the specified fields.
  GenerateDartModel copyWith({
    String? className,
    Set<dynamic>? fields,
    bool? shouldInherit,
    String? inheritanceConstructor,
    String? keyStringCase,
    String? description,
    String? tableName,
    String? schema,
    List<Map<String, dynamic>>? indexes,
  }) {
    return GenerateDartModel.assertRequired(
      className: className ?? this.className,
      fields: fields ?? this.fields,
      shouldInherit: shouldInherit ?? this.shouldInherit,
      inheritanceConstructor:
          inheritanceConstructor ?? this.inheritanceConstructor,
      keyStringCase: keyStringCase ?? this.keyStringCase,
      description: description ?? this.description,
      tableName: tableName ?? this.tableName,
      schema: schema ?? this.schema,
      indexes: indexes ?? this.indexes,
    );
  }

  /// Creates a copy of this instance, removing the specified fields.
  GenerateDartModel copyWithout({
    bool className = true,
    bool fields = true,
    bool shouldInherit = true,
    bool inheritanceConstructor = true,
    bool keyStringCase = true,
    bool description = true,
    bool tableName = true,
    bool schema = true,
    bool indexes = true,
  }) {
    return GenerateDartModel.assertRequired(
      className: className ? this.className : null,
      fields: fields ? this.fields : null,
      shouldInherit: shouldInherit ? this.shouldInherit : null,
      inheritanceConstructor:
          inheritanceConstructor ? this.inheritanceConstructor : null,
      keyStringCase: keyStringCase ? this.keyStringCase : null,
      description: description ? this.description : null,
      tableName: tableName ? this.tableName : null,
      schema: schema ? this.schema : null,
      indexes: indexes ? this.indexes : null,
    );
  }
}
