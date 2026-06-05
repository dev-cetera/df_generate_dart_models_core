# Changelog

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
