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
  /// The full collection path of the model for databases like Firestore.
  String? get collectionPath => collection?.join('/');

  /// The full document path of the model for databases like Firestore.
  String get docPath => doc.join('/');

  /// The table name of the model for SQL-style databases.
  String? get tableName => collection?.lastOrNull;

  /// The full document path of the model, as a list of strings.
  List<String> get doc => [...?collection, id].nonNulls.toList();

  /// Adds two [DataRefModel] objects.
  DataRefModel operator +(DataRefModel other) {
    final temp = [...doc, ...other.doc];
    final length = temp.length;
    if (length.isEven) {
      final collection = temp.sublist(0, length - 1);
      final id = temp.last;
      return DataRefModel(
        id: id,
        collection: collection,
      );
    } else {
      final collection = temp;
      return DataRefModel(
        id: null,
        collection: collection,
      );
    }
  }
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

typedef DataRef = DataRefModel;
