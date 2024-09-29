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

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

class Model extends BaseModel {
  //
  //
  //

  final Map<String, dynamic> _data;
  Map<String, dynamic> get data => _data;

  //
  //
  //

  const Model([this._data = const {}]);

  const Model.fromJson([
    Map<String, dynamic>? otherData,
  ]) : _data = otherData ?? const {};

  factory Model.from(BaseModel? other) {
    return Model(other?.toJson() ?? {});
  }

  factory Model.of(Model other) {
    return Model(other.toJson());
  }

  factory Model.fromJsonString(
    String source,
  ) {
    try {
      return fromJsonStringOrNull(source)!;
    } catch (e) {
      assert(false, 'Model.fromJsonString: $e');
      rethrow;
    }
  }

  static Model? fromJsonStringOrNull(
    String? source,
  ) {
    try {
      if (source!.isNotEmpty) {
        final decoded = letMapOrNull<String, dynamic>(jsonDecode(source));
        return Model.fromJson(decoded);
      } else {
        return const Model();
      }
    } catch (_) {
      return null;
    }
  }

  //
  //
  //

  DataRefModel? get ref => DataRefModel.fromJsonOrNull(letMapOrNull<String, dynamic>(_data['ref']));

  //
  //
  //

  @override
  int get hashCode => toString().hashCode;

  //
  //
  //

  @override
  bool operator ==(Object other) => equals(other);

  //
  //
  //

  @override
  Map<String, dynamic> toJson({
    bool includeNulls = false,
  }) {
    return includeNulls ? _data : _data.nonNulls;
  }

  //
  //
  //

  @override
  Model mergeWith(
    BaseModel? other, {
    bool deepMerge = false,
  }) {
    final a = toJson();
    final b = other?.toJson() ?? {};
    final data = (deepMerge ? mergeDataDeep(a, b) : {...a, ...b}) as Map;
    return Model.fromJson(data.cast());
  }

  //
  //
  //

  @override
  String get $className => 'Model';

  //
  //
  //

  /// Returns a new list from [source] by removing duplicate keys equal to 'ref'.
  static List<T> removeDuplicateRefs<T extends Model>(
    Iterable<T> source,
  ) {
    return removeDuplicateProperties(source, 'ref');
  }

  //
  //
  //

  /// Returns a new list from [source] by removing duplicate properties with
  /// keys equal to [k].
  static List<T> removeDuplicateProperties<T extends Model>(
    Iterable<T> source,
    String k,
  ) {
    final temp = List.of(source);
    final properties = <dynamic>{null};
    temp.removeWhere((m) {
      final json = m.toJson();
      final property = json[k];
      if (properties.contains(property)) {
        return true;
      }
      properties.add(property);
      return false;
    });
    return temp;
  }
}
