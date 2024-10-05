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

@GenerateDartModel(
  shouldInherit: true,
  fields: {
    ('id?', String),
    ('collection?', List<String>),
  },
)
abstract class _DataRefModel extends Model {
  const _DataRefModel();
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

extension DataRefModelExtension on DataRefModel {
  /// The collection path of the model for databases like Firestore.
  String? get collectionPath => collection?.join('/');

  /// The document path of the model for databases like Firestore.
  String get docPath => doc.join('/');

  /// The table name of the model for databases like SQL.
  String? get tableName => collection?.lastOrNull;

  /// The document path of the model.
  List<String> get doc => [...?collection, id].nonNulls.toList();

  /// Adds two [DataRefModel] objects.
  DataRefModel operator +(DataRefModel other) {
    final temp = [...doc, ...other.doc];
    if (temp.isNotEmpty) {
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
    } else {
      return const DataRefModel();
    }
  }
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

typedef DataRef = DataRefModel;
