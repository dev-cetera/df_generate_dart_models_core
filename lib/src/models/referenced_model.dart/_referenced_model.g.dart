//.title
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//
// GENERATED - DO NOT MODIFY BY HAND
// See: https://github.com/DevCetra/df_generate_dart_models
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

part of 'referenced_model.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

/// Generated class for [_ReferencedModel].
class ReferencedModel extends _ReferencedModel {
  //
  //
  //

  /// The runtime type of this class as a String.
  static const CLASS_NAME = 'ReferencedModel';

  @override
  String get $className => CLASS_NAME;

  /// The unique identifier for the document, serving as its primary key.
  final String? id;

  /// A reference to this model that indicates the document's location within the database.
  final DataRefModel? ref;

  /// Constructs a new instance of [ReferencedModel]
  /// from optional and required parameters.
  const ReferencedModel({
    required this.id,
    required this.ref,
  });

  /// Construcs a new instance of [ReferencedModel],
  /// forcing all parameters to be optional.
  const ReferencedModel.optional({
    this.id,
    this.ref,
  });

  /// Constructs a new instance of [ReferencedModel],
  /// and asserts that all required parameters are not null.
  factory ReferencedModel.assertRequired({
    String? id,
    DataRefModel? ref,
  }) {
    assert(id != null);
    assert(ref != null);
    return ReferencedModel(
      id: id,
      ref: ref,
    );
  }

  /// Constructs a new instance of [ReferencedModel],
  /// from the fields of [another] instance. Throws if the conversion fails.
  factory ReferencedModel.from(
    BaseModel another,
  ) {
    try {
      return fromOrNull(another)!;
    } catch (e) {
      assert(false, '$ReferencedModel.from: $e');
      rethrow;
    }
  }

  /// Constructs a new instance of [ReferencedModel],
  /// from the fields of [another] instance. Returns `null` if [another] is
  /// `null` or if the conversion fails.
  @pragma('vm:prefer-inline')
  static ReferencedModel? fromOrNull(
    BaseModel? another,
  ) {
    return fromJsonOrNull(another?.toJson())!;
  }

  /// Constructs a new instance of [ReferencedModel],
  /// from the fields of [another] instance. Throws if the conversion fails.
  factory ReferencedModel.of(
    ReferencedModel another,
  ) {
    try {
      return ofOrNull(another)!;
    } catch (e) {
      assert(false, '$ReferencedModel.of: $e');
      rethrow;
    }
  }

  /// Constructs a new instance of [ReferencedModel],
  /// from the fields of [another] instance. Returns `null` if [another] is
  /// `null` or if the conversion fails.
  @pragma('vm:prefer-inline')
  static ReferencedModel? ofOrNull(
    ReferencedModel? other,
  ) {
    return fromJsonOrNull(other?.toJson());
  }

  /// Constructs a new instance of [ReferencedModel],
  /// from [jsonString], which must be a valid JSON String. Throws if the
  /// conversion fails.
  factory ReferencedModel.fromJsonString(
    String jsonString,
  ) {
    try {
      return fromJsonStringOrNull(jsonString)!;
    } catch (e) {
      assert(false, '$ReferencedModel.fromJsonString: $e');
      rethrow;
    }
  }

  /// Constructs a new instance of [ReferencedModel],
  /// from [jsonString], which must be a valid JSON String. Returns `null` if
  /// [jsonString] is `null` or if the conversion fails.
  static ReferencedModel? fromJsonStringOrNull(
    String? jsonString,
  ) {
    try {
      if (jsonString!.isNotEmpty) {
        final decoded = letMapOrNull<String, dynamic>(jsonDecode(jsonString));
        return ReferencedModel.fromJson(decoded);
      } else {
        return ReferencedModel.assertRequired();
      }
    } catch (_) {
      return null;
    }
  }

  /// Constructs a new instance of [ReferencedModel],
  /// from [json], which must be a valid JSON object. Throws if the conversion
  /// fails.
  factory ReferencedModel.fromJson(
    Map<String, dynamic>? json,
  ) {
    try {
      return fromJsonOrNull(json)!;
    } catch (e) {
      assert(false, '$ReferencedModel.fromJson: $e');
      rethrow;
    }
  }

  /// Constructs a new instance of [ReferencedModel],
  /// from [json], which must be a valid JSON object. Returns `null` if
  /// [json] is `null` or if the conversion fails.
  static ReferencedModel? fromJsonOrNull(
    Map<String, dynamic>? json,
  ) {
    try {
      final id = json?['id']?.toString().trim().nullIfEmpty;
      final ref = dataRefFromString(json?['ref']?.toString());
      return ReferencedModel(
        id: id,
        ref: ref,
      );
    } catch (e) {
      return null;
    }
  }

  /// Constructs a new instance of [ReferencedModel],
  /// from the query parameters of [uri]. Throws if the conversion
  /// fails.
  factory ReferencedModel.fromUri(
    Uri? uri,
  ) {
    try {
      return fromUriOrNull(uri)!;
    } catch (e) {
      assert(false, '$ReferencedModel.fromUri: $e');
      rethrow;
    }
  }

  /// Constructs a new instance of [ReferencedModel],
  /// from the query parameters of [uri]. Returns `null` if [uri] is `null` or
  /// if the conversion fails.
  static ReferencedModel? fromUriOrNull(
    Uri? uri,
  ) {
    try {
      if (uri != null && uri.path == CLASS_NAME) {
        return ReferencedModel.fromJson(uri.queryParameters);
      } else {
        return ReferencedModel.assertRequired();
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
      final id0 = id?.trim().nullIfEmpty;
      final ref0 = ref?.path;
      final withNulls = {
        'ref': ref0,
        'id': id0,
      };
      return includeNulls ? withNulls : withNulls.nonNulls;
    } catch (e) {
      assert(false, '$ReferencedModel.toJson: $e');
      rethrow;
    }
  }

  @override
  BaseModel mergeWith(
    BaseModel? other, {
    bool deepMerge = false,
  }) {
    final a = toJson();
    final b = other?.toJson() ?? {};
    final data = (deepMerge ? mergeDataDeep(a, b) : {...a, ...b}) as Map;
    return ReferencedModel.fromJson(data.cast());
  }

  /// Creates a copy of this instance, replacing the specified fields.
  ReferencedModel copyWithReferencedModelProperties({
    String? id,
    DataRefModel? ref,
  }) {
    return ReferencedModel.assertRequired(
      id: id ?? this.id,
      ref: ref ?? this.ref,
    );
  }

  /// Creates a copy of this instance, removing the specified fields.
  ReferencedModel copyWithoutReferencedModelProperties({
    bool id = true,
    bool ref = true,
  }) {
    return ReferencedModel.assertRequired(
      id: id ? this.id : null,
      ref: ref ? this.ref : null,
    );
  }

  /// Returns the value of the [id] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
  @pragma('vm:prefer-inline')
  String get id$ => id!;

  /// Returns the value of the [ref] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
  @pragma('vm:prefer-inline')
  DataRefModel get ref$ => ref!;
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

abstract final class ReferencedModelFieldNames {
  /// The field name of [ReferencedModel.id].
  static const id = 'id';

  /// The field name of [ReferencedModel.ref].
  static const ref = 'ref';
}
