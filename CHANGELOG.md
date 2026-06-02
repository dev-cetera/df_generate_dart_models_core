# Changelog

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
