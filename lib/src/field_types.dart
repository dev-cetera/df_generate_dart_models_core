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

/// Catalogue of prefix-vocabulary `fieldType` strings recognised by the
/// generator's mapper composition. Use these constants instead of raw
/// string literals — typos turn into compile errors, and IDE
/// autocomplete shows the full menu of dialect/type combinations.
///
/// Naming follows `dialectType` / `dialectTypeOfDartType`:
///   FieldTypes.pgText          → 'PG_text-String'
///   FieldTypes.pgBigint        → 'PG_bigint-int'
///   FieldTypes.sqliteEpochms   → 'SQLITE_epochms-DateTime'
///   FieldTypes.fsTimestamp     → 'FS_timestamp-DateTime'
///   FieldTypes.strictString    → 'STRICT-String'
///
/// Parameterised types (varchar, numeric, enum, jsonb-of-model) need
/// runtime arguments, so they're exposed as static methods rather than
/// constants:
///   FieldTypes.pgVarchar(255)          → 'PG_varchar(255)-String'
///   FieldTypes.pgNumeric(10, 2)        → 'PG_numeric(10,2)-String'
///   FieldTypes.pgEnum('status', 'StatusType') → 'PG_enum(status)-StatusType'
///   FieldTypes.pgJsonbModel('ModelMediaItem')  → 'PG_jsonb-ModelMediaItem'
///   FieldTypes.pgJsonbList('ModelComment')     → `'PG_jsonb-List<ModelComment>'`
abstract final class FieldTypes {
  // ───────────────────────────────────────────────────────────────────────
  // Core Dart types (no dialect prefix)
  // ───────────────────────────────────────────────────────────────────────

  static const String string = 'String';
  static const String integer = 'int';
  static const String double_ = 'double';
  static const String num_ = 'num';
  static const String bool_ = 'bool';
  static const String dateTime = 'DateTime';
  static const String duration = 'Duration';
  static const String uri = 'Uri';
  static const String bigInt = 'BigInt';
  static const String uint8List = 'Uint8List';
  static const String regExp = 'RegExp';
  static const String dynamic_ = 'dynamic';

  // Flutter painting types (resolved by the loose mappers when present).
  static const String color = 'Color';
  static const String offset = 'Offset';
  static const String size = 'Size';
  static const String rect = 'Rect';
  static const String edgeInsets = 'EdgeInsets';
  static const String alignment = 'Alignment';
  static const String radius = 'Radius';

  // ───────────────────────────────────────────────────────────────────────
  // STRICT- — json_serializable-style direct casts; throws on shape mismatch
  // ───────────────────────────────────────────────────────────────────────

  static const String strictString = 'STRICT-String';
  static const String strictInt = 'STRICT-int';
  static const String strictDouble = 'STRICT-double';
  static const String strictNum = 'STRICT-num';
  static const String strictBool = 'STRICT-bool';
  static const String strictDateTime = 'STRICT-DateTime';
  static const String strictUri = 'STRICT-Uri';
  static const String strictBigInt = 'STRICT-BigInt';
  static const String strictUint8List = 'STRICT-Uint8List';

  /// `STRICT-<ModelXxx>` — direct-cast nested model.
  static String strictModel(String modelName) => 'STRICT-$modelName';

  /// `STRICT-<XxxType>` — direct-cast enum.
  static String strictEnum(String enumTypeName) => 'STRICT-$enumTypeName';

  /// `STRICT-List<T>` / `STRICT-Set<T>` / `STRICT-Map<K, V>`.
  static String strictList(String elementType) => 'STRICT-List<$elementType>';
  static String strictSet(String elementType) => 'STRICT-Set<$elementType>';
  static String strictMap(String keyType, String valueType) =>
      'STRICT-Map<$keyType, $valueType>';

  // ───────────────────────────────────────────────────────────────────────
  // PG_ — Postgres
  // ───────────────────────────────────────────────────────────────────────

  // Character / text -------------------------------------------------------
  static const String pgText = 'PG_text-String';
  static const String pgCitext = 'PG_citext-String';
  static const String pgUuid = 'PG_uuid-String';
  static const String pgName = 'PG_name-String';
  static const String pgXml = 'PG_xml-String';
  static const String pgInet = 'PG_inet-String';
  static const String pgCidr = 'PG_cidr-String';
  static const String pgMacaddr = 'PG_macaddr-String';
  static const String pgMacaddr8 = 'PG_macaddr8-String';
  static const String pgTsvector = 'PG_tsvector-String';
  static const String pgTsquery = 'PG_tsquery-String';
  static const String pgMoney = 'PG_money-String';
  static const String pgBit = 'PG_bit-String';
  static const String pgOid = 'PG_oid-String';

  /// `PG_varchar(N)-String` — sized varchar.
  static String pgVarchar(int size) => 'PG_varchar($size)-String';

  /// `PG_char(N)-String` — fixed-size char.
  static String pgChar(int size) => 'PG_char($size)-String';

  // Integers ---------------------------------------------------------------
  static const String pgSmallint = 'PG_smallint-int';
  static const String pgInteger = 'PG_integer-int';
  static const String pgBigint = 'PG_bigint-int';
  static const String pgSmallserial = 'PG_smallserial-int';
  static const String pgSerial = 'PG_serial-int';
  static const String pgBigserial = 'PG_bigserial-int';

  // Floats / numerics ------------------------------------------------------
  static const String pgReal = 'PG_real-double';
  static const String pgDouble = 'PG_double-double';
  static const String pgNumeric = 'PG_numeric-String';
  static const String pgNumericAsDouble = 'PG_numeric-double';

  /// `PG_numeric(p,s)-String` — precision-preserving.
  static String pgNumericParam(int precision, int scale) =>
      'PG_numeric($precision,$scale)-String';

  /// `PG_numeric(p,s)-double` — lossy convenience form.
  static String pgNumericParamAsDouble(int precision, int scale) =>
      'PG_numeric($precision,$scale)-double';

  // Booleans ---------------------------------------------------------------
  static const String pgBoolean = 'PG_boolean-bool';

  // Date/time --------------------------------------------------------------
  static const String pgTimestamp = 'PG_timestamp-DateTime';
  static const String pgTimestamptz = 'PG_timestamptz-DateTime';
  static const String pgDate = 'PG_date-DateTime';
  static const String pgInterval = 'PG_interval-Duration';

  /// `PG_timestamp(p)-DateTime` with precision.
  static String pgTimestampParam(int precision) =>
      'PG_timestamp($precision)-DateTime';

  /// `PG_timestamptz(p)-DateTime` with precision.
  static String pgTimestamptzParam(int precision) =>
      'PG_timestamptz($precision)-DateTime';

  // Bytes ------------------------------------------------------------------
  static const String pgBytea = 'PG_bytea-Uint8List';

  // Enums ------------------------------------------------------------------

  /// `PG_enum(<pgEnumName>)-<DartTypeName>`. The parens carry the
  /// Postgres enum type name (for DBML); the suffix is the Dart class.
  static String pgEnum(String pgEnumName, String dartTypeName) =>
      'PG_enum($pgEnumName)-$dartTypeName';

  // JSON / JSONB -----------------------------------------------------------
  static const String pgJsonbMapStringDynamic =
      'PG_jsonb-Map<String, dynamic>';
  static const String pgJsonMapStringDynamic = 'PG_json-Map<String, dynamic>';

  /// `PG_jsonb-<ModelXxx>` — nested model in jsonb.
  static String pgJsonbModel(String modelName) => 'PG_jsonb-$modelName';

  /// `PG_jsonb-List<T>` — list embedded in jsonb (T can be primitive or
  /// nested model name).
  static String pgJsonbList(String elementType) => 'PG_jsonb-List<$elementType>';

  /// `PG_jsonb-Set<T>`.
  static String pgJsonbSet(String elementType) => 'PG_jsonb-Set<$elementType>';

  /// `PG_jsonb-Map<K, V>` with custom key/value types.
  static String pgJsonbMap({String key = 'String', String value = 'dynamic'}) =>
      'PG_jsonb-Map<$key, $value>';

  /// `PG_json-<ModelXxx>` — same shape as `pgJsonbModel` but for `json`.
  static String pgJsonModel(String modelName) => 'PG_json-$modelName';

  /// `PG_json-List<T>`.
  static String pgJsonList(String elementType) => 'PG_json-List<$elementType>';

  // Native arrays ----------------------------------------------------------
  static const String pgTextArray = 'PG_text[]-List<String>';
  static const String pgIntegerArray = 'PG_integer[]-List<int>';
  static const String pgBigintArray = 'PG_bigint[]-List<int>';
  static const String pgUuidArray = 'PG_uuid[]-List<String>';

  /// Generic native-array helper.
  static String pgArray(String pgElementType, String dartListType) =>
      'PG_$pgElementType[]-$dartListType';

  // ───────────────────────────────────────────────────────────────────────
  // SQLITE_
  // ───────────────────────────────────────────────────────────────────────

  static const String sqliteText = 'SQLITE_text-String';
  static const String sqliteVarchar = 'SQLITE_varchar-String';
  static const String sqliteClob = 'SQLITE_clob-String';

  static const String sqliteInteger = 'SQLITE_integer-int';
  static const String sqliteIntegerBool = 'SQLITE_integer-bool';

  static const String sqliteReal = 'SQLITE_real-double';
  static const String sqliteNumeric = 'SQLITE_numeric-String';
  static const String sqliteNumericAsDouble = 'SQLITE_numeric-double';

  static const String sqliteBlob = 'SQLITE_blob-Uint8List';

  // DateTime variants — SQLite has no native DateTime; pick the storage form.
  static const String sqliteTextDateTime = 'SQLITE_text-DateTime';
  static const String sqliteEpochs = 'SQLITE_epochs-DateTime';
  static const String sqliteEpochms = 'SQLITE_epochms-DateTime';
  static const String sqliteJulianday = 'SQLITE_julianday-DateTime';

  // JSON columns — TEXT-backed under the hood, jsonEncode on write.
  static const String sqliteJsonMapStringDynamic =
      'SQLITE_json-Map<String, dynamic>';
  static const String sqliteJsonbMapStringDynamic =
      'SQLITE_jsonb-Map<String, dynamic>';

  /// `SQLITE_json-<ModelXxx>`.
  static String sqliteJsonModel(String modelName) => 'SQLITE_json-$modelName';

  /// `SQLITE_json-List<T>`.
  static String sqliteJsonList(String elementType) =>
      'SQLITE_json-List<$elementType>';

  /// `SQLITE_jsonb-<ModelXxx>` — SQLite 3.45+ binary JSON.
  static String sqliteJsonbModel(String modelName) =>
      'SQLITE_jsonb-$modelName';

  // ───────────────────────────────────────────────────────────────────────
  // FS_ — Firestore
  // ───────────────────────────────────────────────────────────────────────

  static const String fsTimestamp = 'FS_timestamp-DateTime';
  static const String fsServerTimestamp = 'FS_server_timestamp-DateTime';
  static const String fsGeopoint = 'FS_geopoint-GeoPoint';
  static const String fsRef = 'FS_ref-String';
  static const String fsBlob = 'FS_blob-Uint8List';

  // Back-compat — bare Timestamp without an FS_ prefix.
  static const String timestamp = 'Timestamp';
}
