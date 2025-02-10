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

part of 'generate_dart_model.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

/// Generated class for [_GenerateDartModel].
class GenerateDartModel extends _GenerateDartModel {
  //
  //
  //

  /// The runtime type of this class as a String.
  static const CLASS_NAME = 'GenerateDartModel';

  @override
  String get $className => CLASS_NAME;

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

  /// Constructs a new instance of [GenerateDartModel]
  /// from optional and required parameters.
  const GenerateDartModel({
    this.className,
    this.fields,
    this.shouldInherit,
    this.inheritanceConstructor,
    this.keyStringCase,
    this.description,
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
  }) {
    return GenerateDartModel(
      className: className,
      fields: fields,
      shouldInherit: shouldInherit,
      inheritanceConstructor: inheritanceConstructor,
      keyStringCase: keyStringCase,
      description: description,
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
    return fromJsonOrNull(another?.toJson())!;
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
    try {
      if (jsonString!.isNotEmpty) {
        final decoded = letMapOrNull<String, dynamic>(jsonDecode(jsonString));
        return GenerateDartModel.fromJson(decoded);
      } else {
        return GenerateDartModel.assertRequired();
      }
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
      final shouldInherit = letAsOrNull<bool>(json?['shouldInherit']);
      final inheritanceConstructor = json?['inheritanceConstructor']?.toString().trim().nullIfEmpty;
      final keyStringCase = json?['keyStringCase']?.toString().trim().nullIfEmpty;
      final description = json?['description']?.toString().trim().nullIfEmpty;
      return GenerateDartModel(
        className: className,
        fields: fields,
        shouldInherit: shouldInherit,
        inheritanceConstructor: inheritanceConstructor,
        keyStringCase: keyStringCase,
        description: description,
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
    try {
      if (uri != null && uri.path == CLASS_NAME) {
        return GenerateDartModel.fromJson(uri.queryParameters);
      } else {
        return GenerateDartModel.assertRequired();
      }
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
      final inheritanceConstructor0 = inheritanceConstructor?.trim().nullIfEmpty;
      final keyStringCase0 = keyStringCase?.trim().nullIfEmpty;
      final description0 = description?.trim().nullIfEmpty;
      final withNulls = {
        'shouldInherit': shouldInherit0,
        'keyStringCase': keyStringCase0,
        'inheritanceConstructor': inheritanceConstructor0,
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
  }) {
    return GenerateDartModel.assertRequired(
      className: className ?? this.className,
      fields: fields ?? this.fields,
      shouldInherit: shouldInherit ?? this.shouldInherit,
      inheritanceConstructor: inheritanceConstructor ?? this.inheritanceConstructor,
      keyStringCase: keyStringCase ?? this.keyStringCase,
      description: description ?? this.description,
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
  }) {
    return GenerateDartModel.assertRequired(
      className: className ? this.className : null,
      fields: fields ? this.fields : null,
      shouldInherit: shouldInherit ? this.shouldInherit : null,
      inheritanceConstructor: inheritanceConstructor ? this.inheritanceConstructor : null,
      keyStringCase: keyStringCase ? this.keyStringCase : null,
      description: description ? this.description : null,
    );
  }
}
