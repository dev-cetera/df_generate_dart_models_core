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

import 'package:equatable/equatable.dart' show EquatableMixin;

import '/df_generate_dart_models_core.dart';

part '_data_ref_model.g.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

const DATA_REF_FIELDS = {
  Field(
    fieldPath: ['id'],
    // TODO: Create a T_NO_SPACES_STRING and T_TRIMMED_STRING and T_TRIMMED_STRING_LOWERCASE, etc.
    fieldType: String,
    nullable: true,
    description:
        'The document ID within the database. If null, the reference points to a collection instead of a specific document.',
  ),
  Field(
    fieldPath: ['collection'],
    fieldType: List<String>,
    nullable: false,
    description:
        'A list representing the hierarchical path where the document or collection resides.',
  ),
};

@GenerateDartModel(shouldInherit: true, fields: DATA_REF_FIELDS)
abstract class _DataRefModel extends ThisModel<DataRefModel>
    with EquatableMixin {
  const _DataRefModel();

  //
  //
  //

  @override
  List<Object?> get props => [...?model.collection, model.id];

  //
  //
  //

  @override
  bool? get stringify => false;
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

extension DataRefModelExtension on DataRefModel {
  /// Returns true [collection] is not `null`, does not contain only empty strings, and is not empty.
  bool get hasValidCollection => (collection != null &&
      collection!.map((e) => e.trim().nullIfEmpty).nonNulls.isNotEmpty);

  /// Returns true [id] is not `null` and is not empty.
  bool get hasValidId => id != null && id!.trim().isEmpty;

  // Returns true if the reference points only to a collection and not a document.
  bool get isOnlyCollectionRef => hasValidCollection && !hasValidId;

  // Returns true if the reference points to a document.
  bool get isDocumentRef => hasValidCollection && hasValidId;

  /// Returns the parent segments of the collection path. This is the collection
  /// path without the last segment.
  List<String> get parentSegments {
    if (collection == null || collection!.isEmpty) return [];
    return collection!.sublist(0, collection!.length - 1);
  }

  /// Returns the parent path of the collection path. This is the collection
  /// path without the last segment.
  String get parentPath => parentSegments.join('/');

  /// Returns the collection ID, which is the last segment in the collection
  /// path.
  String get collectionId {
    if (collection == null || collection!.isEmpty) return '';
    return collection!.last;
  }

  /// The full collection path of the reference, always ending in "/".
  String? get collectionPath {
    if (collection == null || collection!.isEmpty) {
      return null;
    }
    // Collection segments must be odd
    if (collection!.length.isEven) {
      throw StateError(
        '[DataRefModelExtension] Invalid collection path: Collection must have an odd number of segments.',
      );
    }
    return '${collection!.join('/')}/';
  }

  /// The full path of the reference. If it ends with "/", it's a path to a
  /// collection, otherwise it's a path to a document.
  String get path {
    if (collectionPath == null) {
      throw StateError(
        '[DataRefModelExtension] Invalid path: Collection path cannot be empty.',
      );
    }
    return '$collectionPath${id ?? ''}';
  }

  /// The table name, i.e. the last element in [collection].
  String? get tableName {
    if (collection == null || collection!.isEmpty) {
      throw StateError(
        '[DataRefModelExtension] Invalid collection: Collection cannot be null or empty.',
      );
    }
    return collection?.lastOrNull;
  }

  /// The full path segments of the reference, in order, including the
  /// document ID if it's not null.
  List<String> get pathSegments {
    if (collection == null) {
      throw StateError(
        '[DataRefModelExtension] Invalid collection: Collection cannot be null.',
      );
    }
    final segments = [...?collection, id].nonNulls.toList();
    if (segments.isEmpty) {
      throw StateError(
        '[DataRefModelExtension] Invalid path: Path segments cannot be empty.',
      );
    }
    return segments;
  }

  /// Adds two [DataRefModel] objects. Collection paths must have an odd number of segments.
  DataRefModel operator +(DataRefModel other) {
    final temp = [...pathSegments, ...other.pathSegments];
    final length = temp.length;

    // Check that collection segments always have an odd length
    if (length.isEven) {
      final collection = temp.sublist(0, length - 1);
      if (collection.length.isEven) {
        throw StateError(
          '[DataRefModelExtension] Invalid collection path: Collection must have an odd number of segments.',
        );
      }
      final id = temp.last;
      return DataRefModel(id: id, collection: collection);
    } else {
      final collection = temp;
      if (collection.length.isEven) {
        throw StateError(
          '[DataRefModelExtension] Invalid collection path: Collection must have an odd number of segments.',
        );
      }
      return DataRefModel(id: null, collection: collection);
    }
  }
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

/// Creates a [DataRefModel] from a given path string. If the path ends with a
/// '/', it represents a collection path, otherwise, it represents a document
/// path.
DataRefModel? dataRefFromString(String? input) {
  if (input == null) {
    return null;
  }

  final segments = input.split('/').where((e) => e.isNotEmpty).toList();

  if (segments.isEmpty) {
    throw ArgumentError('[dataRefFromString] Input cannot be an empty path.');
  }

  final endsWithSlash = input.endsWith('/');

  final isCollectionPath = endsWithSlash && segments.length.isOdd;
  final isDocumentPath = !endsWithSlash && segments.length.isEven;

  if (!isCollectionPath && !isDocumentPath) {
    throw ArgumentError(
      '[dataRefFromString] Invalid path: Path must end with "/" for collection paths, or not end with "/" for document paths.',
    );
  }

  // The last segment is the ID if it's a document path.
  final id = isDocumentPath ? segments.removeLast() : null;

  return DataRefModel(id: id, collection: segments);
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

typedef DataRef = DataRefModel;
