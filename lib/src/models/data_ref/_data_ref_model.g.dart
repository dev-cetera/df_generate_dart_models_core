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

part of 'data_ref_model.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

/// Generated class for [_DataRefModel].
class DataRefModel extends Model {
  //
  //
  //

  /// The runtime type of this class as a String.
  static const CLASS_NAME = 'DataRefModel';

  @override
  String get $className => CLASS_NAME;

  

  /// Constructs a new instance of [DataRefModel]
  /// from optional and required parameters.
  const DataRefModel({
    
  }) ;

  /// Construcs a new instance of [DataRefModel],
  /// forcing all parameters to be optional.
  const DataRefModel.optional({
    
  }) ;


  /// Constructs a new instance of [DataRefModel],
  /// and asserts that all required parameters are not null.
  factory DataRefModel.assertRequired({
    
  }) {
    
    return const DataRefModel(
      
    );
  }

  /// Constructs a new instance of [DataRefModel],
  /// from the fields of [another] instance. Throws if the conversion fails.
  factory DataRefModel.from(
    BaseModel another,
  ) {
    try {
      return fromOrNull(another)!;
    } catch (e) {
      assert(false, '$DataRefModel.from: $e');
      rethrow;
    }
  }

  /// Constructs a new instance of [DataRefModel],
  /// from the fields of [another] instance. Returns `null` if [another] is
  /// `null` or if the conversion fails.
  @pragma('vm:prefer-inline')
  static DataRefModel? fromOrNull(
    BaseModel? another,
  ) {
    return fromJsonOrNull(another?.toJson())!;
  }


  /// Constructs a new instance of [DataRefModel],
  /// from the fields of [another] instance. Throws if the conversion fails.
  factory DataRefModel.of(
    DataRefModel another,
  ) {
    try {
      return ofOrNull(another)!;
    } catch (e) {
      assert(false, '$DataRefModel.of: $e');
      rethrow;
    }
  }

  /// Constructs a new instance of [DataRefModel],
  /// from the fields of [another] instance. Returns `null` if [another] is
  /// `null` or if the conversion fails.
  @pragma('vm:prefer-inline')
  static DataRefModel? ofOrNull(
    DataRefModel? other,
  ) {
    return fromJsonOrNull(other?.toJson());
  }

  /// Constructs a new instance of [DataRefModel],
  /// from [jsonString], which must be a valid JSON String. Throws if the
  /// conversion fails.
  factory DataRefModel.fromJsonString(
    String jsonString,
  ) {
    try {
      return fromJsonStringOrNull(jsonString)!;
    } catch (e) {
     assert(false, '$DataRefModel.fromJsonString: $e');
      rethrow;
    }
  }

  /// Constructs a new instance of [DataRefModel],
  /// from [jsonString], which must be a valid JSON String. Returns `null` if
  /// [jsonString] is `null` or if the conversion fails.
  static DataRefModel? fromJsonStringOrNull(
    String? jsonString,
  ) {
    try {
      if (jsonString!.isNotEmpty) {
        final decoded = letMapOrNull<String, dynamic>(jsonDecode(jsonString));
        return DataRefModel.fromJson(decoded);
      } else {
        return DataRefModel.assertRequired();
      }
    } catch (_) {
      return null;
    }
  }

  /// Constructs a new instance of [DataRefModel],
  /// from [json], which must be a valid JSON object. Throws if the conversion
  /// fails.
  factory DataRefModel.fromJson(
    Map<String, dynamic>? json,
  ) {
    try {
      return fromJsonOrNull(json)!;
    } catch (e) {
      assert(false, '$DataRefModel.fromJson: $e');
      rethrow;
    }
  }

  /// Constructs a new instance of [DataRefModel],
  /// from [json], which must be a valid JSON object. Returns `null` if
  /// [json] is `null` or if the conversion fails.
  static DataRefModel? fromJsonOrNull(
    Map<String, dynamic>? json,
  ) {
    try {
      
      return const DataRefModel(
        
      );
    } catch (e) {
      return null;
    }
  }

  /// Constructs a new instance of [DataRefModel],
  /// from the query parameters of [uri]. Throws if the conversion
  /// fails.
  factory DataRefModel.fromUri(
    Uri? uri,
  ) {
    try {
      return fromUriOrNull(uri)!;
    } catch (e) {
      assert(false, '$DataRefModel.fromUri: $e');
      rethrow;
    }
  }

  /// Constructs a new instance of [DataRefModel],
  /// from the query parameters of [uri]. Returns `null` if [uri] is `null` or
  /// if the conversion fails.
  static DataRefModel? fromUriOrNull(
    Uri? uri,
  ) {
    try {
      if (uri != null && uri.path == CLASS_NAME) {
        return DataRefModel.fromJson(uri.queryParameters);
      } else {
        return DataRefModel.assertRequired();
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
      assert(false, '$DataRefModel.toJson: $e');
      rethrow;
    }
  }

  
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

abstract final class DataRefModelFieldNames {
  
}

extension DataRefModelX on DataRefModel {
  /// Creates a copy of this instance, merging another model's fields into
  /// this model's fields.
  DataRefModel mergeWith(
    BaseModel? other, {
    bool deepMerge = false,
  }) {
    final a = toJson();
    final b = other?.toJson() ?? {};
    final data = (deepMerge ? mergeDataDeep(a, b) : {...a, ...b}) as Map;
    return DataRefModel.fromJson(data.cast());
  }

  /// Creates a copy of this instance, replacing the specified fields.
  DataRefModel copyWith(DataRefModel src, {
    
  }) {
    final src = this;
    return DataRefModel.assertRequired(
      
    );
  }

  /// Creates a copy of this instance, removing the specified fields.
  DataRefModel copyWithout(DataRefModel src, {
    
  }) {
    final src = this;
    return DataRefModel.assertRequired(
      
    );
  }
}