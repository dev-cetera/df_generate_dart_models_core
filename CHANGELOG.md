# Changelog

## [0.11.2]

- feat: Add `Field.columnDefault` and `GenerateDartModel.indexes` annotation slots. Both are optional, additive, and DBML-only — consumed by `df_generate_dbml` to emit column `default: <value>`, an `indexes { ... }` block, and (via the model `description`) a table-level `note:`. Neither affects the generated Dart model; existing models compile and behave unchanged.

## [0.11.1]

- chore: bump `df_string` to `^0.4.0` and `df_gen_core` to `^0.8.1`, adopting df_string 0.4.0's case-conversion digit-boundary change (`phone_e164` instead of `phone_e_164`). Model/wire-key generation that runs case conversions on identifiers with embedded digits emits the new form on the next generation run; already-generated code is unaffected until regenerated. All 70 tests pass against df_string 0.4.0.
- build: constrain `equatable` to `>=2.0.7 <2.1.0`. equatable 2.1.0 deprecates `EquatableMixin` (used by the generated models and re-exported here), which trips CI's `dart analyze --fatal-infos`; pin below it until the models migrate off the mixin. The cap propagates to dependents (df_screen_core, etc.) so their analysis stays green too.

## [0.11.0]

- Released @ 6/2026 (UTC)
- New: `tableName: String?` on `@GenerateDartModel` — explicit override for the DBML table name. When null, the table name is derived from the class name (Model prefix/suffix stripped, snake-cased) with no automatic pluralisation
- New: `schema: String?` on `@GenerateDartModel` — DBML emission gate. Models without a schema are skipped; distinct schema values are emitted to their own `<schema>.dbml`. Pass a project-wide const so the schema name has a single source of truth
- New: `referencesFromRecord()` accepts a `String` literal (`references: 'ModelUser'`) in addition to a `Type` literal. Cross-package references no longer need an import chain just to satisfy the analyzer's Type API
- Regenerated meta-model `.g.dart` files carry the new fields and the `static const tableName` + `$values` / `$primaryKey` / `$foreignKeys` metadata constants on the corresponding `FieldNames` classes

## [0.10.0]

- Released @ 6/2026 (UTC)
- New: `Field.fieldPath` accepts `String` (`'profile.id'`), `Iterable<String>` (`['profile', 'id']`), or `null`; multi-segment paths produce deep null-aware accessors (`json?['profile']?['id']`)
- New: `FieldTypes` constants class for prefix-vocabulary strings (`FieldTypes.pgUuid`, `sqliteEpochms`, `fsTimestamp`, …)
- New: `FieldUtils.normalisePath` exposed publicly
- New: `Field` slot field type changed to `Object?` for `fieldPath` and `references`
- Removed: `equatable`, `sqlType`, `onDelete`, `unique`, `referencesColumn`, `fallback`, `unknownEnumValue`, `includeInJson/SqlMap/FirestoreMap`, `converter` slots (deferred to template/inheritance)
- Fix: `DartField.fieldPath` no longer recurses infinitely through `FieldUtils.fieldPathOrNull`
- Pulls in df_gen_core 0.8.0 with mapper robustness fixes

## [0.9.25]

- Released @ 5/2026 (UTC)
- Update version

## [0.9.24]

- Released @ 5/2026 (UTC)
- Update and format
- AI updates

## [0.9.23]

- Released @ 12/2025 (UTC)
- Update dependencies

## [0.9.22]

- Released @ 12/2025 (UTC)
- Update dependencies
