import 'package:df_generate_dart_models_core/df_generate_dart_models_core.dart';
import 'package:test/test.dart';

void main() {
  group('dataRefFromString', () {
    test('null input returns null', () {
      expect(dataRefFromString(null), isNull);
    });

    test('document path: users/u1', () {
      final r = dataRefFromString('users/u1');
      expect(r, isNotNull);
      expect(r!.id, 'u1');
      expect(r.collection, ['users']);
    });

    test('collection path: users/', () {
      final r = dataRefFromString('users/');
      expect(r, isNotNull);
      expect(r!.id, isNull);
      expect(r.collection, ['users']);
    });

    test('nested document: users/u1/posts/p1', () {
      final r = dataRefFromString('users/u1/posts/p1');
      expect(r!.id, 'p1');
      expect(r.collection, ['users', 'u1', 'posts']);
    });

    test('nested collection: users/u1/posts/', () {
      final r = dataRefFromString('users/u1/posts/');
      expect(r!.id, isNull);
      expect(r.collection, ['users', 'u1', 'posts']);
    });

    test('throws on empty input', () {
      expect(() => dataRefFromString(''), throwsArgumentError);
      expect(() => dataRefFromString('///'), throwsArgumentError);
    });

    test('throws on invalid (even-segment collection)', () {
      // "users/u1/" → 2 segments + trailing slash. A collection must have an
      // odd number of segments, so this is rejected.
      expect(() => dataRefFromString('users/u1/'), throwsArgumentError);
    });

    test('throws on invalid (odd-segment document)', () {
      // "users/u1/posts" → 3 segments, no trailing slash. Doc paths must have
      // an even number of segments.
      expect(() => dataRefFromString('users/u1/posts'), throwsArgumentError);
    });
  });

  group('DataRefModelExtension', () {
    test('hasValidCollection', () {
      expect(
        const DataRefModel(collection: ['users']).hasValidCollection,
        isTrue,
      );
      expect(
        const DataRefModel(collection: []).hasValidCollection,
        isFalse,
      );
      expect(
        const DataRefModel(collection: ['', ' ']).hasValidCollection,
        isFalse,
      );
    });

    test('hasValidId', () {
      expect(const DataRefModel(id: 'x', collection: ['c']).hasValidId, isTrue);
      expect(
        const DataRefModel(id: ' ', collection: ['c']).hasValidId,
        isFalse,
      );
      expect(const DataRefModel(collection: ['c']).hasValidId, isFalse);
    });

    test('isDocumentRef vs isOnlyCollectionRef', () {
      const doc = DataRefModel(id: 'u1', collection: ['users']);
      const col = DataRefModel(collection: ['users']);
      expect(doc.isDocumentRef, isTrue);
      expect(doc.isOnlyCollectionRef, isFalse);
      expect(col.isOnlyCollectionRef, isTrue);
      expect(col.isDocumentRef, isFalse);
    });

    test('parentSegments / parentPath', () {
      const r = DataRefModel(collection: ['users', 'u1', 'posts']);
      expect(r.parentSegments, ['users', 'u1']);
      expect(r.parentPath, 'users/u1');
    });

    test('collectionId is the last collection segment', () {
      const r = DataRefModel(collection: ['users', 'u1', 'posts']);
      expect(r.collectionId, 'posts');
    });

    test('collectionPath for valid collection ends in slash', () {
      const r = DataRefModel(collection: ['users']);
      expect(r.collectionPath, 'users/');
    });

    test('collectionPath throws when collection has even length', () {
      const r = DataRefModel(collection: ['users', 'u1']);
      expect(() => r.collectionPath, throwsStateError);
    });

    test('path includes id for document refs', () {
      const r = DataRefModel(id: 'u1', collection: ['users']);
      expect(r.path, 'users/u1');
    });

    test('+ operator combines two refs', () {
      const a = DataRefModel(id: 'u1', collection: ['users']);
      const b = DataRefModel(id: 'p1', collection: ['posts']);
      final combined = a + b;
      // segments: [users, u1, posts, p1] → 4 (even, doc).
      expect(combined.id, 'p1');
      expect(combined.collection, ['users', 'u1', 'posts']);
    });
  });
}
