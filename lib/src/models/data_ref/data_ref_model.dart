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

part '_data_ref_model.g.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

const DATA_REF_FIELDS = {
  Field(
    fieldPath: ['id'],
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

@GenerateDartModel(
  shouldInherit: true,
  fields: DATA_REF_FIELDS,
)
abstract class _DataRefModel extends Model {
  const _DataRefModel();
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

extension DataRefModelExtension on DataRefModel {
  /// The full collection path of the reference, always ending in "/".
  String? get collectionPath {
    if (collection == null) {
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
    final pathSegments = [collectionPath, id].nonNulls;
    if (pathSegments.isEmpty) {
      throw StateError(
        '[DataRefModelExtension] Invalid path: Path cannot be empty.',
      );
    }
    return pathSegments.join('/');
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
      return DataRefModel(
        id: id,
        collection: collection,
      );
    } else {
      final collection = temp;
      if (collection.length.isEven) {
        throw StateError(
          '[DataRefModelExtension] Invalid collection path: Collection must have an odd number of segments.',
        );
      }
      return DataRefModel(
        id: null,
        collection: collection,
      );
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
  final segments = input.split('/').where((segment) => segment.isNotEmpty).toList();

  if (segments.isEmpty) {
    throw ArgumentError('[dataRefFromString] Input cannot be an empty path.');
  }

  // Check if the path ends with a '/'.
  final endsWithSlash = input.endsWith('/');

  // Error if path ends with '/' but has an even number of segments (invalid collection path).
  if (endsWithSlash && segments.length.isEven) {
    throw ArgumentError(
      '[dataRefFromString] Invalid collection path: Collection paths must have an odd number of segments.',
    );
  }

  // Error if path does not end with '/' but has an odd number of segments (invalid document path).
  if (!endsWithSlash && segments.length.isEven) {
    throw ArgumentError(
      '[dataRefFromString] Invalid document path: Document paths must have an even number of segments.',
    );
  }

  // If the path has an odd number of segments, or if it ends with '/', it's a collection path.
  final isDocumentPath = segments.length.isOdd && !endsWithSlash;

  // The last segment is the ID if it's a document path.
  final id = isDocumentPath ? segments.removeLast() : null;

  return DataRefModel(
    id: id,
    collection: segments,
  );
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

typedef DataRef = DataRefModel;
