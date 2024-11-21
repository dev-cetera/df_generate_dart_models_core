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

part of 'generate_dart_model.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

/// Generated class for [_GenerateDartModel].
class GenerateDartModel extends Model {
  //
  //
  //

  /// The runtime type of this class as a String.
  static const CLASS_NAME = 'GenerateDartModel';

  @override
  String get $className => CLASS_NAME;

  

  /// Constructs a new instance of [GenerateDartModel]
  /// from optional and required parameters.
  const GenerateDartModel({
    
  }) ;

  /// Construcs a new instance of [GenerateDartModel],
  /// forcing all parameters to be optional.
  const GenerateDartModel.optional({
    
  }) ;


  /// Constructs a new instance of [GenerateDartModel],
  /// and asserts that all required parameters are not null.
  factory GenerateDartModel.assertRequired({
    
  }) {
    
    return const GenerateDartModel(
      
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
      
      return const GenerateDartModel(
        
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
      
      final withNulls = {
        
      };
      return includeNulls ? withNulls : withNulls.nonNulls;
    } catch (e) {
      assert(false, '$GenerateDartModel.toJson: $e');
      rethrow;
    }
  }

  
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

abstract final class GenerateDartModelFieldNames {
  
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
  GenerateDartModel copyWith(GenerateDartModel src, {
    
  }) {
    final src = this;
    return GenerateDartModel.assertRequired(
      
    );
  }

  /// Creates a copy of this instance, removing the specified fields.
  GenerateDartModel copyWithout(GenerateDartModel src, {
    
  }) {
    final src = this;
    return GenerateDartModel.assertRequired(
      
    );
  }
}