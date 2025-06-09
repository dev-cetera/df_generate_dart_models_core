//.title
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//
// Dart/Flutter (DF) Packages by dev-cetera.com & contributors. The use of this
// source code is governed by an MIT-style license described in the LICENSE
// file located in this project's root directory.
//
// See: https://opensource.org/license/mit
//
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//.title~

import 'dart:convert' show JsonEncoder;

import '/df_generate_dart_models_core.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

abstract mixin class BaseModel {
  //
  //
  //

  const BaseModel();

  //
  //
  //

  /// Returns a JSON string representation of the BaseModel.
  String toJsonString() {
    try {
      final encoder = const JsonEncoder.withIndent('  ');
      return encoder.convert(sortedJson());
    } catch (e) {
      return '{"e": "${e.safeToString()}"}';
    }
  }

  //
  //
  //

  @override
  String toString() => toJsonString();

  //
  //
  //

  /// Returns a Json i.e. `Map<String, dynamic>` representation of the BaseModel.
  Map<String, dynamic> toJson({bool includeNulls = false});

  //
  //
  //

  /// Returns a Json i.e. `Map<String, dynamic>` representation of the BaseModel,
  /// with the keys sorted alphabetically.
  Map<String, dynamic> sortedJson({bool includeNulls = false}) {
    final a = toJson(includeNulls: includeNulls);
    final b = a.keys.toList(growable: false)..sort((k1, k2) => k1.compareTo(k2));
    final c = {for (var k in b) k: a[k] as dynamic};
    return c;
  }

  //
  //
  //

  /// Converts the current [BaseModel] to a [Uri] that can be used as a
  /// distinct identifier. The model must not be too large to avoid exceeding
  /// the maximum length of a URL.
  Uri toUrl() {
    return Uri(
      path: $className,
      queryParameters: toJson().mapValues((v) => v.toString()),
    );
  }

  //
  //
  //

  /// Compares the BaseModel with another BaseModel using the
  /// `DeepCollectionEquality` and returns `true` if they are equal.
  bool equals(dynamic other) {
    if (other is BaseModel) {
      return const DeepCollectionEquality().equals(other.toJson(), toJson());
    } else {
      return false;
    }
  }

  //
  //
  //

  /// The runtime type of this class as a String.
  String get $className;
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

/// A class that extends [BaseModel] that provides a reference to itself.
@Deprecated('Use ThisModelMixin instead.')
abstract class ThisModel<T extends BaseModel> extends BaseModel with ThisModelMixin {
  const ThisModel();
}

/// A mixin on [BaseModel] that provides a reference to itself.
mixin ThisModelMixin<T extends BaseModel> on BaseModel {
  T get model => this as T;
}
