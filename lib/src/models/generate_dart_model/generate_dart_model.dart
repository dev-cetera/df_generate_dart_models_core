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

import '/df_generate_dart_models_core.dart';

part '_generate_dart_model.g.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

const GENERATE_DART_MODEL_FIELDS = {
  Field(
    fieldPath: ['className'],
    fieldType: String,
    nullable: true,
    description:
        'The class name to be used. If left null, the name is derived from the annotated class.',
  ),
  Field(
    fieldPath: ['fields'],
    fieldType: Set<dynamic>,
    nullable: true,
    description:
        'A collection of fields, represented as [Field] instances, to be generated for the class.',
  ),
  Field(
    fieldPath: ['shouldInherit'],
    fieldType: bool,
    nullable: true,
    description:
        'Determines whether the annotated class should be inherited by the generated class.',
  ),
  Field(
    fieldPath: ['inheritanceConstructor'],
    fieldType: String,
    nullable: true,
    description:
        'The constructor from the superclass to use, if a custom one is required.',
  ),
  Field(
    fieldPath: ['keyStringCase'],
    fieldType: String,
    nullable: true,
    description:
        'Specifies the case format for the keys, with "CAMEL_CASE" as the default.',
  ),
  Field(
    fieldPath: ['description'],
    fieldType: String,
    nullable: true,
    description: 'A comment describing the generated class.',
  ),
  Field(
    fieldPath: ['equatable'],
    fieldType: bool,
    nullable: true,
    description:
        'Whether to mix in EquatableMixin for value-based ==/hashCode. '
        'Defaults to true. Set false for classes that get used as elements '
        'inside a const Set in another annotation — Dart forbids const set '
        'elements from overriding == / hashCode, so the FieldModel/Field type '
        'itself opts out.',
  ),
};

@GenerateDartModel(shouldInherit: true, fields: GENERATE_DART_MODEL_FIELDS)
abstract class _GenerateDartModel extends Model {
  const _GenerateDartModel();
}
