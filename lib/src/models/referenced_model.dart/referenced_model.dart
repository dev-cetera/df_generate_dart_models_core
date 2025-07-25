//.title
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//
// Copyright © dev-cetera.com & contributors.
//
// The use of this source code is governed by an MIT-style license described in
// the LICENSE file located in this project's root directory.
//
// See: https://opensource.org/license/mit
//
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//.title~

import 'package:equatable/equatable.dart' show EquatableMixin;

import '/df_generate_dart_models_core.dart';

part '_referenced_model.g.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

const REFERENCED_MODEL_FIELDS = {
  Field(
    fieldPath: ['id'],
    fieldType: String,
    nullable: false,
    primaryKey: true,
    description: 'The unique identifier for the document, serving as its primary key.',
  ),
  Field(
    fieldPath: ['ref'],
    fieldType: DataRefModel,
    nullable: false,
    primaryKey: true,
    description:
        "A reference to this model that indicates the document's location within the database.",
  ),
};

@GenerateDartModel(shouldInherit: true, fields: REFERENCED_MODEL_FIELDS)
abstract class _ReferencedModel extends Model implements EquatableMixin {
  const _ReferencedModel();

  //
  //
  //

  @pragma('vm:prefer-inline')
  ReferencedModel get _model => this as ReferencedModel;

  //
  //
  //

  @pragma('vm:prefer-inline')
  @override
  List<Object?> get props => [_model.id, _model.ref];

  //
  //
  //

  @pragma('vm:prefer-inline')
  @override
  bool? get stringify => false;
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

/// Returns a list of unique [ReferencedModel]s from [input]. Uniqueness is
/// determined by the [ReferencedModel.ref] property.
Iterable<T> uniqueRefs<T extends ReferencedModel>(Iterable<T> input) {
  return input
      .fold<Map<String?, T>>(
        {},
        (map, e) => map..putIfAbsent(e.ref?.path, () => e),
      )
      .values
      .nonNulls;
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

/// A mixin on [ReferencedModel] that implements [EquatableMixin] to identify
/// the model by [id] an [ref].
mixin ReferencedModelEqualityMixin<T extends ReferencedModel>
    implements ReferencedModel, EquatableMixin {
  //
  //
  //

  @override
  @pragma('vm:prefer-inline')
  ReferencedModel get _model => this as ReferencedModel;

  //
  //
  //

  @pragma('vm:prefer-inline')
  @override
  List<Object?> get props => [_model.id, _model.ref];

  //
  //
  //

  @pragma('vm:prefer-inline')
  @override
  bool? get stringify => false;
}
