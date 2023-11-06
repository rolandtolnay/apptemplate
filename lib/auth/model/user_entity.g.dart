// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_entity.dart';

// **************************************************************************
// CollectionGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, require_trailing_commas, prefer_single_quotes, prefer_double_quotes, use_super_parameters, duplicate_ignore
// ignore_for_file: type=lint

class _Sentinel {
  const _Sentinel();
}

const _sentinel = _Sentinel();

/// A collection reference object can be used for adding documents,
/// getting document references, and querying for documents
/// (using the methods inherited from Query).
abstract class UserEntityCollectionReference
    implements
        UserEntityQuery,
        FirestoreCollectionReference<UserEntity, UserEntityQuerySnapshot> {
  factory UserEntityCollectionReference([
    FirebaseFirestore? firestore,
  ]) = _$UserEntityCollectionReference;

  static UserEntity fromFirestore(
    DocumentSnapshot<Map<String, Object?>> snapshot,
    SnapshotOptions? options,
  ) {
    return _$UserEntityFromJson(snapshot.data()!);
  }

  static Map<String, Object?> toFirestore(
    UserEntity value,
    SetOptions? options,
  ) {
    return _$UserEntityToJson(value);
  }

  @override
  CollectionReference<UserEntity> get reference;

  @override
  UserEntityDocumentReference doc([String? id]);

  /// Add a new document to this collection with the specified data,
  /// assigning it a document ID automatically.
  Future<UserEntityDocumentReference> add(UserEntity value);
}

class _$UserEntityCollectionReference extends _$UserEntityQuery
    implements UserEntityCollectionReference {
  factory _$UserEntityCollectionReference([FirebaseFirestore? firestore]) {
    firestore ??= FirebaseFirestore.instance;

    return _$UserEntityCollectionReference._(
      firestore.collection('users').withConverter(
            fromFirestore: UserEntityCollectionReference.fromFirestore,
            toFirestore: UserEntityCollectionReference.toFirestore,
          ),
    );
  }

  _$UserEntityCollectionReference._(
    CollectionReference<UserEntity> reference,
  ) : super(reference, $referenceWithoutCursor: reference);

  String get path => reference.path;

  @override
  CollectionReference<UserEntity> get reference =>
      super.reference as CollectionReference<UserEntity>;

  @override
  UserEntityDocumentReference doc([String? id]) {
    assert(
      id == null || id.split('/').length == 1,
      'The document ID cannot be from a different collection',
    );
    return UserEntityDocumentReference(
      reference.doc(id),
    );
  }

  @override
  Future<UserEntityDocumentReference> add(UserEntity value) {
    return reference.add(value).then((ref) => UserEntityDocumentReference(ref));
  }

  @override
  bool operator ==(Object other) {
    return other is _$UserEntityCollectionReference &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

abstract class UserEntityDocumentReference
    extends FirestoreDocumentReference<UserEntity, UserEntityDocumentSnapshot> {
  factory UserEntityDocumentReference(DocumentReference<UserEntity> reference) =
      _$UserEntityDocumentReference;

  DocumentReference<UserEntity> get reference;

  /// A reference to the [UserEntityCollectionReference] containing this document.
  UserEntityCollectionReference get parent {
    return _$UserEntityCollectionReference(reference.firestore);
  }

  @override
  Stream<UserEntityDocumentSnapshot> snapshots();

  @override
  Future<UserEntityDocumentSnapshot> get([GetOptions? options]);

  @override
  Future<void> delete();

  /// Updates data on the document. Data will be merged with any existing
  /// document data.
  ///
  /// If no document exists yet, the update will fail.
  Future<void> update({
    String id,
    FieldValue idFieldValue,
    String? email,
    FieldValue emailFieldValue,
    String? displayName,
    FieldValue displayNameFieldValue,
    String? photoUrl,
    FieldValue photoUrlFieldValue,
    Set<String> linkedProviders,
    FieldValue linkedProvidersFieldValue,
    DateTime createdOn,
    FieldValue createdOnFieldValue,
    Language language,
    FieldValue languageFieldValue,
    bool isOnboarded,
    FieldValue isOnboardedFieldValue,
    PushNotificationPermission pushPermission,
    FieldValue pushPermissionFieldValue,
  });

  /// Updates fields in the current document using the transaction API.
  ///
  /// The update will fail if applied to a document that does not exist.
  void transactionUpdate(
    Transaction transaction, {
    String id,
    FieldValue idFieldValue,
    String? email,
    FieldValue emailFieldValue,
    String? displayName,
    FieldValue displayNameFieldValue,
    String? photoUrl,
    FieldValue photoUrlFieldValue,
    Set<String> linkedProviders,
    FieldValue linkedProvidersFieldValue,
    DateTime createdOn,
    FieldValue createdOnFieldValue,
    Language language,
    FieldValue languageFieldValue,
    bool isOnboarded,
    FieldValue isOnboardedFieldValue,
    PushNotificationPermission pushPermission,
    FieldValue pushPermissionFieldValue,
  });
}

class _$UserEntityDocumentReference
    extends FirestoreDocumentReference<UserEntity, UserEntityDocumentSnapshot>
    implements UserEntityDocumentReference {
  _$UserEntityDocumentReference(this.reference);

  @override
  final DocumentReference<UserEntity> reference;

  /// A reference to the [UserEntityCollectionReference] containing this document.
  UserEntityCollectionReference get parent {
    return _$UserEntityCollectionReference(reference.firestore);
  }

  @override
  Stream<UserEntityDocumentSnapshot> snapshots() {
    return reference.snapshots().map(UserEntityDocumentSnapshot._);
  }

  @override
  Future<UserEntityDocumentSnapshot> get([GetOptions? options]) {
    return reference.get(options).then(UserEntityDocumentSnapshot._);
  }

  @override
  Future<UserEntityDocumentSnapshot> transactionGet(Transaction transaction) {
    return transaction.get(reference).then(UserEntityDocumentSnapshot._);
  }

  Future<void> update({
    Object? id = _sentinel,
    FieldValue? idFieldValue,
    Object? email = _sentinel,
    FieldValue? emailFieldValue,
    Object? displayName = _sentinel,
    FieldValue? displayNameFieldValue,
    Object? photoUrl = _sentinel,
    FieldValue? photoUrlFieldValue,
    Object? linkedProviders = _sentinel,
    FieldValue? linkedProvidersFieldValue,
    Object? createdOn = _sentinel,
    FieldValue? createdOnFieldValue,
    Object? language = _sentinel,
    FieldValue? languageFieldValue,
    Object? isOnboarded = _sentinel,
    FieldValue? isOnboardedFieldValue,
    Object? pushPermission = _sentinel,
    FieldValue? pushPermissionFieldValue,
  }) async {
    assert(
      id == _sentinel || idFieldValue == null,
      "Cannot specify both id and idFieldValue",
    );
    assert(
      email == _sentinel || emailFieldValue == null,
      "Cannot specify both email and emailFieldValue",
    );
    assert(
      displayName == _sentinel || displayNameFieldValue == null,
      "Cannot specify both displayName and displayNameFieldValue",
    );
    assert(
      photoUrl == _sentinel || photoUrlFieldValue == null,
      "Cannot specify both photoUrl and photoUrlFieldValue",
    );
    assert(
      linkedProviders == _sentinel || linkedProvidersFieldValue == null,
      "Cannot specify both linkedProviders and linkedProvidersFieldValue",
    );
    assert(
      createdOn == _sentinel || createdOnFieldValue == null,
      "Cannot specify both createdOn and createdOnFieldValue",
    );
    assert(
      language == _sentinel || languageFieldValue == null,
      "Cannot specify both language and languageFieldValue",
    );
    assert(
      isOnboarded == _sentinel || isOnboardedFieldValue == null,
      "Cannot specify both isOnboarded and isOnboardedFieldValue",
    );
    assert(
      pushPermission == _sentinel || pushPermissionFieldValue == null,
      "Cannot specify both pushPermission and pushPermissionFieldValue",
    );
    final json = {
      if (id != _sentinel)
        _$UserEntityFieldMap['id']!:
            _$UserEntityPerFieldToJson.id(id as String),
      if (idFieldValue != null) _$UserEntityFieldMap['id']!: idFieldValue,
      if (email != _sentinel)
        _$UserEntityFieldMap['email']!:
            _$UserEntityPerFieldToJson.email(email as String?),
      if (emailFieldValue != null)
        _$UserEntityFieldMap['email']!: emailFieldValue,
      if (displayName != _sentinel)
        _$UserEntityFieldMap['displayName']!:
            _$UserEntityPerFieldToJson.displayName(displayName as String?),
      if (displayNameFieldValue != null)
        _$UserEntityFieldMap['displayName']!: displayNameFieldValue,
      if (photoUrl != _sentinel)
        _$UserEntityFieldMap['photoUrl']!:
            _$UserEntityPerFieldToJson.photoUrl(photoUrl as String?),
      if (photoUrlFieldValue != null)
        _$UserEntityFieldMap['photoUrl']!: photoUrlFieldValue,
      if (linkedProviders != _sentinel)
        _$UserEntityFieldMap['linkedProviders']!: _$UserEntityPerFieldToJson
            .linkedProviders(linkedProviders as Set<String>),
      if (linkedProvidersFieldValue != null)
        _$UserEntityFieldMap['linkedProviders']!: linkedProvidersFieldValue,
      if (createdOn != _sentinel)
        _$UserEntityFieldMap['createdOn']!:
            _$UserEntityPerFieldToJson.createdOn(createdOn as DateTime),
      if (createdOnFieldValue != null)
        _$UserEntityFieldMap['createdOn']!: createdOnFieldValue,
      if (language != _sentinel)
        _$UserEntityFieldMap['language']!:
            _$UserEntityPerFieldToJson.language(language as Language),
      if (languageFieldValue != null)
        _$UserEntityFieldMap['language']!: languageFieldValue,
      if (isOnboarded != _sentinel)
        _$UserEntityFieldMap['isOnboarded']!:
            _$UserEntityPerFieldToJson.isOnboarded(isOnboarded as bool),
      if (isOnboardedFieldValue != null)
        _$UserEntityFieldMap['isOnboarded']!: isOnboardedFieldValue,
      if (pushPermission != _sentinel)
        _$UserEntityFieldMap['pushPermission']!: _$UserEntityPerFieldToJson
            .pushPermission(pushPermission as PushNotificationPermission),
      if (pushPermissionFieldValue != null)
        _$UserEntityFieldMap['pushPermission']!: pushPermissionFieldValue,
    };

    return reference.update(json);
  }

  void transactionUpdate(
    Transaction transaction, {
    Object? id = _sentinel,
    FieldValue? idFieldValue,
    Object? email = _sentinel,
    FieldValue? emailFieldValue,
    Object? displayName = _sentinel,
    FieldValue? displayNameFieldValue,
    Object? photoUrl = _sentinel,
    FieldValue? photoUrlFieldValue,
    Object? linkedProviders = _sentinel,
    FieldValue? linkedProvidersFieldValue,
    Object? createdOn = _sentinel,
    FieldValue? createdOnFieldValue,
    Object? language = _sentinel,
    FieldValue? languageFieldValue,
    Object? isOnboarded = _sentinel,
    FieldValue? isOnboardedFieldValue,
    Object? pushPermission = _sentinel,
    FieldValue? pushPermissionFieldValue,
  }) {
    assert(
      id == _sentinel || idFieldValue == null,
      "Cannot specify both id and idFieldValue",
    );
    assert(
      email == _sentinel || emailFieldValue == null,
      "Cannot specify both email and emailFieldValue",
    );
    assert(
      displayName == _sentinel || displayNameFieldValue == null,
      "Cannot specify both displayName and displayNameFieldValue",
    );
    assert(
      photoUrl == _sentinel || photoUrlFieldValue == null,
      "Cannot specify both photoUrl and photoUrlFieldValue",
    );
    assert(
      linkedProviders == _sentinel || linkedProvidersFieldValue == null,
      "Cannot specify both linkedProviders and linkedProvidersFieldValue",
    );
    assert(
      createdOn == _sentinel || createdOnFieldValue == null,
      "Cannot specify both createdOn and createdOnFieldValue",
    );
    assert(
      language == _sentinel || languageFieldValue == null,
      "Cannot specify both language and languageFieldValue",
    );
    assert(
      isOnboarded == _sentinel || isOnboardedFieldValue == null,
      "Cannot specify both isOnboarded and isOnboardedFieldValue",
    );
    assert(
      pushPermission == _sentinel || pushPermissionFieldValue == null,
      "Cannot specify both pushPermission and pushPermissionFieldValue",
    );
    final json = {
      if (id != _sentinel)
        _$UserEntityFieldMap['id']!:
            _$UserEntityPerFieldToJson.id(id as String),
      if (idFieldValue != null) _$UserEntityFieldMap['id']!: idFieldValue,
      if (email != _sentinel)
        _$UserEntityFieldMap['email']!:
            _$UserEntityPerFieldToJson.email(email as String?),
      if (emailFieldValue != null)
        _$UserEntityFieldMap['email']!: emailFieldValue,
      if (displayName != _sentinel)
        _$UserEntityFieldMap['displayName']!:
            _$UserEntityPerFieldToJson.displayName(displayName as String?),
      if (displayNameFieldValue != null)
        _$UserEntityFieldMap['displayName']!: displayNameFieldValue,
      if (photoUrl != _sentinel)
        _$UserEntityFieldMap['photoUrl']!:
            _$UserEntityPerFieldToJson.photoUrl(photoUrl as String?),
      if (photoUrlFieldValue != null)
        _$UserEntityFieldMap['photoUrl']!: photoUrlFieldValue,
      if (linkedProviders != _sentinel)
        _$UserEntityFieldMap['linkedProviders']!: _$UserEntityPerFieldToJson
            .linkedProviders(linkedProviders as Set<String>),
      if (linkedProvidersFieldValue != null)
        _$UserEntityFieldMap['linkedProviders']!: linkedProvidersFieldValue,
      if (createdOn != _sentinel)
        _$UserEntityFieldMap['createdOn']!:
            _$UserEntityPerFieldToJson.createdOn(createdOn as DateTime),
      if (createdOnFieldValue != null)
        _$UserEntityFieldMap['createdOn']!: createdOnFieldValue,
      if (language != _sentinel)
        _$UserEntityFieldMap['language']!:
            _$UserEntityPerFieldToJson.language(language as Language),
      if (languageFieldValue != null)
        _$UserEntityFieldMap['language']!: languageFieldValue,
      if (isOnboarded != _sentinel)
        _$UserEntityFieldMap['isOnboarded']!:
            _$UserEntityPerFieldToJson.isOnboarded(isOnboarded as bool),
      if (isOnboardedFieldValue != null)
        _$UserEntityFieldMap['isOnboarded']!: isOnboardedFieldValue,
      if (pushPermission != _sentinel)
        _$UserEntityFieldMap['pushPermission']!: _$UserEntityPerFieldToJson
            .pushPermission(pushPermission as PushNotificationPermission),
      if (pushPermissionFieldValue != null)
        _$UserEntityFieldMap['pushPermission']!: pushPermissionFieldValue,
    };

    transaction.update(reference, json);
  }

  @override
  bool operator ==(Object other) {
    return other is UserEntityDocumentReference &&
        other.runtimeType == runtimeType &&
        other.parent == parent &&
        other.id == id;
  }

  @override
  int get hashCode => Object.hash(runtimeType, parent, id);
}

abstract class UserEntityQuery
    implements QueryReference<UserEntity, UserEntityQuerySnapshot> {
  @override
  UserEntityQuery limit(int limit);

  @override
  UserEntityQuery limitToLast(int limit);

  /// Perform an order query based on a [FieldPath].
  ///
  /// This method is considered unsafe as it does check that the field path
  /// maps to a valid property or that parameters such as [isEqualTo] receive
  /// a value of the correct type.
  ///
  /// If possible, instead use the more explicit variant of order queries:
  ///
  /// **AVOID**:
  /// ```dart
  /// collection.orderByFieldPath(
  ///   FieldPath.fromString('title'),
  ///   startAt: 'title',
  /// );
  /// ```
  ///
  /// **PREFER**:
  /// ```dart
  /// collection.orderByTitle(startAt: 'title');
  /// ```
  UserEntityQuery orderByFieldPath(
    FieldPath fieldPath, {
    bool descending = false,
    Object? startAt,
    Object? startAfter,
    Object? endAt,
    Object? endBefore,
    UserEntityDocumentSnapshot? startAtDocument,
    UserEntityDocumentSnapshot? endAtDocument,
    UserEntityDocumentSnapshot? endBeforeDocument,
    UserEntityDocumentSnapshot? startAfterDocument,
  });

  /// Perform a where query based on a [FieldPath].
  ///
  /// This method is considered unsafe as it does check that the field path
  /// maps to a valid property or that parameters such as [isEqualTo] receive
  /// a value of the correct type.
  ///
  /// If possible, instead use the more explicit variant of where queries:
  ///
  /// **AVOID**:
  /// ```dart
  /// collection.whereFieldPath(FieldPath.fromString('title'), isEqualTo: 'title');
  /// ```
  ///
  /// **PREFER**:
  /// ```dart
  /// collection.whereTitle(isEqualTo: 'title');
  /// ```
  UserEntityQuery whereFieldPath(
    FieldPath fieldPath, {
    Object? isEqualTo,
    Object? isNotEqualTo,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    Object? arrayContains,
    List<Object?>? arrayContainsAny,
    List<Object?>? whereIn,
    List<Object?>? whereNotIn,
    bool? isNull,
  });

  UserEntityQuery whereDocumentId({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  });
  UserEntityQuery whereId({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  });
  UserEntityQuery whereEmail({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String?>? whereIn,
    List<String?>? whereNotIn,
  });
  UserEntityQuery whereDisplayName({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String?>? whereIn,
    List<String?>? whereNotIn,
  });
  UserEntityQuery wherePhotoUrl({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String?>? whereIn,
    List<String?>? whereNotIn,
  });
  UserEntityQuery whereLinkedProviders({
    Set<String>? isEqualTo,
    Set<String>? isNotEqualTo,
    Set<String>? isLessThan,
    Set<String>? isLessThanOrEqualTo,
    Set<String>? isGreaterThan,
    Set<String>? isGreaterThanOrEqualTo,
    bool? isNull,
    String? arrayContains,
    Set<String>? arrayContainsAny,
  });
  UserEntityQuery whereCreatedOn({
    DateTime? isEqualTo,
    DateTime? isNotEqualTo,
    DateTime? isLessThan,
    DateTime? isLessThanOrEqualTo,
    DateTime? isGreaterThan,
    DateTime? isGreaterThanOrEqualTo,
    bool? isNull,
    List<DateTime>? whereIn,
    List<DateTime>? whereNotIn,
  });
  UserEntityQuery whereLanguage({
    Language? isEqualTo,
    Language? isNotEqualTo,
    Language? isLessThan,
    Language? isLessThanOrEqualTo,
    Language? isGreaterThan,
    Language? isGreaterThanOrEqualTo,
    bool? isNull,
    List<Language>? whereIn,
    List<Language>? whereNotIn,
  });
  UserEntityQuery whereIsOnboarded({
    bool? isEqualTo,
    bool? isNotEqualTo,
    bool? isLessThan,
    bool? isLessThanOrEqualTo,
    bool? isGreaterThan,
    bool? isGreaterThanOrEqualTo,
    bool? isNull,
    List<bool>? whereIn,
    List<bool>? whereNotIn,
  });
  UserEntityQuery wherePushPermission({
    PushNotificationPermission? isEqualTo,
    PushNotificationPermission? isNotEqualTo,
    PushNotificationPermission? isLessThan,
    PushNotificationPermission? isLessThanOrEqualTo,
    PushNotificationPermission? isGreaterThan,
    PushNotificationPermission? isGreaterThanOrEqualTo,
    bool? isNull,
    List<PushNotificationPermission>? whereIn,
    List<PushNotificationPermission>? whereNotIn,
  });

  UserEntityQuery orderByDocumentId({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    UserEntityDocumentSnapshot? startAtDocument,
    UserEntityDocumentSnapshot? endAtDocument,
    UserEntityDocumentSnapshot? endBeforeDocument,
    UserEntityDocumentSnapshot? startAfterDocument,
  });

  UserEntityQuery orderById({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    UserEntityDocumentSnapshot? startAtDocument,
    UserEntityDocumentSnapshot? endAtDocument,
    UserEntityDocumentSnapshot? endBeforeDocument,
    UserEntityDocumentSnapshot? startAfterDocument,
  });

  UserEntityQuery orderByEmail({
    bool descending = false,
    String? startAt,
    String? startAfter,
    String? endAt,
    String? endBefore,
    UserEntityDocumentSnapshot? startAtDocument,
    UserEntityDocumentSnapshot? endAtDocument,
    UserEntityDocumentSnapshot? endBeforeDocument,
    UserEntityDocumentSnapshot? startAfterDocument,
  });

  UserEntityQuery orderByDisplayName({
    bool descending = false,
    String? startAt,
    String? startAfter,
    String? endAt,
    String? endBefore,
    UserEntityDocumentSnapshot? startAtDocument,
    UserEntityDocumentSnapshot? endAtDocument,
    UserEntityDocumentSnapshot? endBeforeDocument,
    UserEntityDocumentSnapshot? startAfterDocument,
  });

  UserEntityQuery orderByPhotoUrl({
    bool descending = false,
    String? startAt,
    String? startAfter,
    String? endAt,
    String? endBefore,
    UserEntityDocumentSnapshot? startAtDocument,
    UserEntityDocumentSnapshot? endAtDocument,
    UserEntityDocumentSnapshot? endBeforeDocument,
    UserEntityDocumentSnapshot? startAfterDocument,
  });

  UserEntityQuery orderByLinkedProviders({
    bool descending = false,
    Set<String> startAt,
    Set<String> startAfter,
    Set<String> endAt,
    Set<String> endBefore,
    UserEntityDocumentSnapshot? startAtDocument,
    UserEntityDocumentSnapshot? endAtDocument,
    UserEntityDocumentSnapshot? endBeforeDocument,
    UserEntityDocumentSnapshot? startAfterDocument,
  });

  UserEntityQuery orderByCreatedOn({
    bool descending = false,
    DateTime startAt,
    DateTime startAfter,
    DateTime endAt,
    DateTime endBefore,
    UserEntityDocumentSnapshot? startAtDocument,
    UserEntityDocumentSnapshot? endAtDocument,
    UserEntityDocumentSnapshot? endBeforeDocument,
    UserEntityDocumentSnapshot? startAfterDocument,
  });

  UserEntityQuery orderByLanguage({
    bool descending = false,
    Language startAt,
    Language startAfter,
    Language endAt,
    Language endBefore,
    UserEntityDocumentSnapshot? startAtDocument,
    UserEntityDocumentSnapshot? endAtDocument,
    UserEntityDocumentSnapshot? endBeforeDocument,
    UserEntityDocumentSnapshot? startAfterDocument,
  });

  UserEntityQuery orderByIsOnboarded({
    bool descending = false,
    bool startAt,
    bool startAfter,
    bool endAt,
    bool endBefore,
    UserEntityDocumentSnapshot? startAtDocument,
    UserEntityDocumentSnapshot? endAtDocument,
    UserEntityDocumentSnapshot? endBeforeDocument,
    UserEntityDocumentSnapshot? startAfterDocument,
  });

  UserEntityQuery orderByPushPermission({
    bool descending = false,
    PushNotificationPermission startAt,
    PushNotificationPermission startAfter,
    PushNotificationPermission endAt,
    PushNotificationPermission endBefore,
    UserEntityDocumentSnapshot? startAtDocument,
    UserEntityDocumentSnapshot? endAtDocument,
    UserEntityDocumentSnapshot? endBeforeDocument,
    UserEntityDocumentSnapshot? startAfterDocument,
  });
}

class _$UserEntityQuery
    extends QueryReference<UserEntity, UserEntityQuerySnapshot>
    implements UserEntityQuery {
  _$UserEntityQuery(
    this._collection, {
    required Query<UserEntity> $referenceWithoutCursor,
    $QueryCursor $queryCursor = const $QueryCursor(),
  }) : super(
          $referenceWithoutCursor: $referenceWithoutCursor,
          $queryCursor: $queryCursor,
        );

  final CollectionReference<Object?> _collection;

  @override
  Stream<UserEntityQuerySnapshot> snapshots([SnapshotOptions? options]) {
    return reference
        .snapshots()
        .map(UserEntityQuerySnapshot._fromQuerySnapshot);
  }

  @override
  Future<UserEntityQuerySnapshot> get([GetOptions? options]) {
    return reference
        .get(options)
        .then(UserEntityQuerySnapshot._fromQuerySnapshot);
  }

  @override
  UserEntityQuery limit(int limit) {
    return _$UserEntityQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.limit(limit),
      $queryCursor: $queryCursor,
    );
  }

  @override
  UserEntityQuery limitToLast(int limit) {
    return _$UserEntityQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.limitToLast(limit),
      $queryCursor: $queryCursor,
    );
  }

  UserEntityQuery orderByFieldPath(
    FieldPath fieldPath, {
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    UserEntityDocumentSnapshot? startAtDocument,
    UserEntityDocumentSnapshot? endAtDocument,
    UserEntityDocumentSnapshot? endBeforeDocument,
    UserEntityDocumentSnapshot? startAfterDocument,
  }) {
    final query =
        $referenceWithoutCursor.orderBy(fieldPath, descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }
    return _$UserEntityQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  UserEntityQuery whereFieldPath(
    FieldPath fieldPath, {
    Object? isEqualTo,
    Object? isNotEqualTo,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    Object? arrayContains,
    List<Object?>? arrayContainsAny,
    List<Object?>? whereIn,
    List<Object?>? whereNotIn,
    bool? isNull,
  }) {
    return _$UserEntityQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        fieldPath,
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        arrayContains: arrayContains,
        arrayContainsAny: arrayContainsAny,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
        isNull: isNull,
      ),
      $queryCursor: $queryCursor,
    );
  }

  UserEntityQuery whereDocumentId({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  }) {
    return _$UserEntityQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        FieldPath.documentId,
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      $queryCursor: $queryCursor,
    );
  }

  UserEntityQuery whereId({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  }) {
    return _$UserEntityQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$UserEntityFieldMap['id']!,
        isEqualTo:
            isEqualTo != null ? _$UserEntityPerFieldToJson.id(isEqualTo) : null,
        isNotEqualTo: isNotEqualTo != null
            ? _$UserEntityPerFieldToJson.id(isNotEqualTo)
            : null,
        isLessThan: isLessThan != null
            ? _$UserEntityPerFieldToJson.id(isLessThan)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$UserEntityPerFieldToJson.id(isLessThanOrEqualTo)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$UserEntityPerFieldToJson.id(isGreaterThan)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$UserEntityPerFieldToJson.id(isGreaterThanOrEqualTo)
            : null,
        isNull: isNull,
        whereIn: whereIn?.map((e) => _$UserEntityPerFieldToJson.id(e)),
        whereNotIn: whereNotIn?.map((e) => _$UserEntityPerFieldToJson.id(e)),
      ),
      $queryCursor: $queryCursor,
    );
  }

  UserEntityQuery whereEmail({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String?>? whereIn,
    List<String?>? whereNotIn,
  }) {
    return _$UserEntityQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$UserEntityFieldMap['email']!,
        isEqualTo: isEqualTo != null
            ? _$UserEntityPerFieldToJson.email(isEqualTo)
            : null,
        isNotEqualTo: isNotEqualTo != null
            ? _$UserEntityPerFieldToJson.email(isNotEqualTo)
            : null,
        isLessThan: isLessThan != null
            ? _$UserEntityPerFieldToJson.email(isLessThan)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$UserEntityPerFieldToJson.email(isLessThanOrEqualTo)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$UserEntityPerFieldToJson.email(isGreaterThan)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$UserEntityPerFieldToJson.email(isGreaterThanOrEqualTo)
            : null,
        isNull: isNull,
        whereIn: whereIn?.map((e) => _$UserEntityPerFieldToJson.email(e)),
        whereNotIn: whereNotIn?.map((e) => _$UserEntityPerFieldToJson.email(e)),
      ),
      $queryCursor: $queryCursor,
    );
  }

  UserEntityQuery whereDisplayName({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String?>? whereIn,
    List<String?>? whereNotIn,
  }) {
    return _$UserEntityQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$UserEntityFieldMap['displayName']!,
        isEqualTo: isEqualTo != null
            ? _$UserEntityPerFieldToJson.displayName(isEqualTo)
            : null,
        isNotEqualTo: isNotEqualTo != null
            ? _$UserEntityPerFieldToJson.displayName(isNotEqualTo)
            : null,
        isLessThan: isLessThan != null
            ? _$UserEntityPerFieldToJson.displayName(isLessThan)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$UserEntityPerFieldToJson.displayName(isLessThanOrEqualTo)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$UserEntityPerFieldToJson.displayName(isGreaterThan)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$UserEntityPerFieldToJson.displayName(isGreaterThanOrEqualTo)
            : null,
        isNull: isNull,
        whereIn: whereIn?.map((e) => _$UserEntityPerFieldToJson.displayName(e)),
        whereNotIn:
            whereNotIn?.map((e) => _$UserEntityPerFieldToJson.displayName(e)),
      ),
      $queryCursor: $queryCursor,
    );
  }

  UserEntityQuery wherePhotoUrl({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String?>? whereIn,
    List<String?>? whereNotIn,
  }) {
    return _$UserEntityQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$UserEntityFieldMap['photoUrl']!,
        isEqualTo: isEqualTo != null
            ? _$UserEntityPerFieldToJson.photoUrl(isEqualTo)
            : null,
        isNotEqualTo: isNotEqualTo != null
            ? _$UserEntityPerFieldToJson.photoUrl(isNotEqualTo)
            : null,
        isLessThan: isLessThan != null
            ? _$UserEntityPerFieldToJson.photoUrl(isLessThan)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$UserEntityPerFieldToJson.photoUrl(isLessThanOrEqualTo)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$UserEntityPerFieldToJson.photoUrl(isGreaterThan)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$UserEntityPerFieldToJson.photoUrl(isGreaterThanOrEqualTo)
            : null,
        isNull: isNull,
        whereIn: whereIn?.map((e) => _$UserEntityPerFieldToJson.photoUrl(e)),
        whereNotIn:
            whereNotIn?.map((e) => _$UserEntityPerFieldToJson.photoUrl(e)),
      ),
      $queryCursor: $queryCursor,
    );
  }

  UserEntityQuery whereLinkedProviders({
    Set<String>? isEqualTo,
    Set<String>? isNotEqualTo,
    Set<String>? isLessThan,
    Set<String>? isLessThanOrEqualTo,
    Set<String>? isGreaterThan,
    Set<String>? isGreaterThanOrEqualTo,
    bool? isNull,
    String? arrayContains,
    Set<String>? arrayContainsAny,
  }) {
    return _$UserEntityQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$UserEntityFieldMap['linkedProviders']!,
        isEqualTo: isEqualTo != null
            ? _$UserEntityPerFieldToJson.linkedProviders(isEqualTo)
            : null,
        isNotEqualTo: isNotEqualTo != null
            ? _$UserEntityPerFieldToJson.linkedProviders(isNotEqualTo)
            : null,
        isLessThan: isLessThan != null
            ? _$UserEntityPerFieldToJson.linkedProviders(isLessThan)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$UserEntityPerFieldToJson.linkedProviders(isLessThanOrEqualTo)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$UserEntityPerFieldToJson.linkedProviders(isGreaterThan)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$UserEntityPerFieldToJson.linkedProviders(isGreaterThanOrEqualTo)
            : null,
        isNull: isNull,
        arrayContains: arrayContains != null
            ? (_$UserEntityPerFieldToJson.linkedProviders({arrayContains})
                    as List?)!
                .single
            : null,
        arrayContainsAny: arrayContainsAny != null
            ? _$UserEntityPerFieldToJson.linkedProviders(arrayContainsAny)
                as Iterable<Object>?
            : null,
      ),
      $queryCursor: $queryCursor,
    );
  }

  UserEntityQuery whereCreatedOn({
    DateTime? isEqualTo,
    DateTime? isNotEqualTo,
    DateTime? isLessThan,
    DateTime? isLessThanOrEqualTo,
    DateTime? isGreaterThan,
    DateTime? isGreaterThanOrEqualTo,
    bool? isNull,
    List<DateTime>? whereIn,
    List<DateTime>? whereNotIn,
  }) {
    return _$UserEntityQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$UserEntityFieldMap['createdOn']!,
        isEqualTo: isEqualTo != null
            ? _$UserEntityPerFieldToJson.createdOn(isEqualTo)
            : null,
        isNotEqualTo: isNotEqualTo != null
            ? _$UserEntityPerFieldToJson.createdOn(isNotEqualTo)
            : null,
        isLessThan: isLessThan != null
            ? _$UserEntityPerFieldToJson.createdOn(isLessThan)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$UserEntityPerFieldToJson.createdOn(isLessThanOrEqualTo)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$UserEntityPerFieldToJson.createdOn(isGreaterThan)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$UserEntityPerFieldToJson.createdOn(isGreaterThanOrEqualTo)
            : null,
        isNull: isNull,
        whereIn: whereIn?.map((e) => _$UserEntityPerFieldToJson.createdOn(e)),
        whereNotIn:
            whereNotIn?.map((e) => _$UserEntityPerFieldToJson.createdOn(e)),
      ),
      $queryCursor: $queryCursor,
    );
  }

  UserEntityQuery whereLanguage({
    Language? isEqualTo,
    Language? isNotEqualTo,
    Language? isLessThan,
    Language? isLessThanOrEqualTo,
    Language? isGreaterThan,
    Language? isGreaterThanOrEqualTo,
    bool? isNull,
    List<Language>? whereIn,
    List<Language>? whereNotIn,
  }) {
    return _$UserEntityQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$UserEntityFieldMap['language']!,
        isEqualTo: isEqualTo != null
            ? _$UserEntityPerFieldToJson.language(isEqualTo)
            : null,
        isNotEqualTo: isNotEqualTo != null
            ? _$UserEntityPerFieldToJson.language(isNotEqualTo)
            : null,
        isLessThan: isLessThan != null
            ? _$UserEntityPerFieldToJson.language(isLessThan)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$UserEntityPerFieldToJson.language(isLessThanOrEqualTo)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$UserEntityPerFieldToJson.language(isGreaterThan)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$UserEntityPerFieldToJson.language(isGreaterThanOrEqualTo)
            : null,
        isNull: isNull,
        whereIn: whereIn?.map((e) => _$UserEntityPerFieldToJson.language(e)),
        whereNotIn:
            whereNotIn?.map((e) => _$UserEntityPerFieldToJson.language(e)),
      ),
      $queryCursor: $queryCursor,
    );
  }

  UserEntityQuery whereIsOnboarded({
    bool? isEqualTo,
    bool? isNotEqualTo,
    bool? isLessThan,
    bool? isLessThanOrEqualTo,
    bool? isGreaterThan,
    bool? isGreaterThanOrEqualTo,
    bool? isNull,
    List<bool>? whereIn,
    List<bool>? whereNotIn,
  }) {
    return _$UserEntityQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$UserEntityFieldMap['isOnboarded']!,
        isEqualTo: isEqualTo != null
            ? _$UserEntityPerFieldToJson.isOnboarded(isEqualTo)
            : null,
        isNotEqualTo: isNotEqualTo != null
            ? _$UserEntityPerFieldToJson.isOnboarded(isNotEqualTo)
            : null,
        isLessThan: isLessThan != null
            ? _$UserEntityPerFieldToJson.isOnboarded(isLessThan)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$UserEntityPerFieldToJson.isOnboarded(isLessThanOrEqualTo)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$UserEntityPerFieldToJson.isOnboarded(isGreaterThan)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$UserEntityPerFieldToJson.isOnboarded(isGreaterThanOrEqualTo)
            : null,
        isNull: isNull,
        whereIn: whereIn?.map((e) => _$UserEntityPerFieldToJson.isOnboarded(e)),
        whereNotIn:
            whereNotIn?.map((e) => _$UserEntityPerFieldToJson.isOnboarded(e)),
      ),
      $queryCursor: $queryCursor,
    );
  }

  UserEntityQuery wherePushPermission({
    PushNotificationPermission? isEqualTo,
    PushNotificationPermission? isNotEqualTo,
    PushNotificationPermission? isLessThan,
    PushNotificationPermission? isLessThanOrEqualTo,
    PushNotificationPermission? isGreaterThan,
    PushNotificationPermission? isGreaterThanOrEqualTo,
    bool? isNull,
    List<PushNotificationPermission>? whereIn,
    List<PushNotificationPermission>? whereNotIn,
  }) {
    return _$UserEntityQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$UserEntityFieldMap['pushPermission']!,
        isEqualTo: isEqualTo != null
            ? _$UserEntityPerFieldToJson.pushPermission(isEqualTo)
            : null,
        isNotEqualTo: isNotEqualTo != null
            ? _$UserEntityPerFieldToJson.pushPermission(isNotEqualTo)
            : null,
        isLessThan: isLessThan != null
            ? _$UserEntityPerFieldToJson.pushPermission(isLessThan)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$UserEntityPerFieldToJson.pushPermission(isLessThanOrEqualTo)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$UserEntityPerFieldToJson.pushPermission(isGreaterThan)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$UserEntityPerFieldToJson.pushPermission(isGreaterThanOrEqualTo)
            : null,
        isNull: isNull,
        whereIn:
            whereIn?.map((e) => _$UserEntityPerFieldToJson.pushPermission(e)),
        whereNotIn: whereNotIn
            ?.map((e) => _$UserEntityPerFieldToJson.pushPermission(e)),
      ),
      $queryCursor: $queryCursor,
    );
  }

  UserEntityQuery orderByDocumentId({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    UserEntityDocumentSnapshot? startAtDocument,
    UserEntityDocumentSnapshot? endAtDocument,
    UserEntityDocumentSnapshot? endBeforeDocument,
    UserEntityDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(FieldPath.documentId,
        descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$UserEntityQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  UserEntityQuery orderById({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    UserEntityDocumentSnapshot? startAtDocument,
    UserEntityDocumentSnapshot? endAtDocument,
    UserEntityDocumentSnapshot? endBeforeDocument,
    UserEntityDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(_$UserEntityFieldMap['id']!,
        descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$UserEntityQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  UserEntityQuery orderByEmail({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    UserEntityDocumentSnapshot? startAtDocument,
    UserEntityDocumentSnapshot? endAtDocument,
    UserEntityDocumentSnapshot? endBeforeDocument,
    UserEntityDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor
        .orderBy(_$UserEntityFieldMap['email']!, descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$UserEntityQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  UserEntityQuery orderByDisplayName({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    UserEntityDocumentSnapshot? startAtDocument,
    UserEntityDocumentSnapshot? endAtDocument,
    UserEntityDocumentSnapshot? endBeforeDocument,
    UserEntityDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor
        .orderBy(_$UserEntityFieldMap['displayName']!, descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$UserEntityQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  UserEntityQuery orderByPhotoUrl({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    UserEntityDocumentSnapshot? startAtDocument,
    UserEntityDocumentSnapshot? endAtDocument,
    UserEntityDocumentSnapshot? endBeforeDocument,
    UserEntityDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor
        .orderBy(_$UserEntityFieldMap['photoUrl']!, descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$UserEntityQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  UserEntityQuery orderByLinkedProviders({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    UserEntityDocumentSnapshot? startAtDocument,
    UserEntityDocumentSnapshot? endAtDocument,
    UserEntityDocumentSnapshot? endBeforeDocument,
    UserEntityDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(
        _$UserEntityFieldMap['linkedProviders']!,
        descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$UserEntityQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  UserEntityQuery orderByCreatedOn({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    UserEntityDocumentSnapshot? startAtDocument,
    UserEntityDocumentSnapshot? endAtDocument,
    UserEntityDocumentSnapshot? endBeforeDocument,
    UserEntityDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor
        .orderBy(_$UserEntityFieldMap['createdOn']!, descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$UserEntityQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  UserEntityQuery orderByLanguage({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    UserEntityDocumentSnapshot? startAtDocument,
    UserEntityDocumentSnapshot? endAtDocument,
    UserEntityDocumentSnapshot? endBeforeDocument,
    UserEntityDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor
        .orderBy(_$UserEntityFieldMap['language']!, descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$UserEntityQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  UserEntityQuery orderByIsOnboarded({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    UserEntityDocumentSnapshot? startAtDocument,
    UserEntityDocumentSnapshot? endAtDocument,
    UserEntityDocumentSnapshot? endBeforeDocument,
    UserEntityDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor
        .orderBy(_$UserEntityFieldMap['isOnboarded']!, descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$UserEntityQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  UserEntityQuery orderByPushPermission({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    UserEntityDocumentSnapshot? startAtDocument,
    UserEntityDocumentSnapshot? endAtDocument,
    UserEntityDocumentSnapshot? endBeforeDocument,
    UserEntityDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(
        _$UserEntityFieldMap['pushPermission']!,
        descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$UserEntityQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is _$UserEntityQuery &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

class UserEntityDocumentSnapshot extends FirestoreDocumentSnapshot<UserEntity> {
  UserEntityDocumentSnapshot._(this.snapshot) : data = snapshot.data();

  @override
  final DocumentSnapshot<UserEntity> snapshot;

  @override
  UserEntityDocumentReference get reference {
    return UserEntityDocumentReference(
      snapshot.reference,
    );
  }

  @override
  final UserEntity? data;
}

class UserEntityQuerySnapshot extends FirestoreQuerySnapshot<UserEntity,
    UserEntityQueryDocumentSnapshot> {
  UserEntityQuerySnapshot._(
    this.snapshot,
    this.docs,
    this.docChanges,
  );

  factory UserEntityQuerySnapshot._fromQuerySnapshot(
    QuerySnapshot<UserEntity> snapshot,
  ) {
    final docs = snapshot.docs.map(UserEntityQueryDocumentSnapshot._).toList();

    final docChanges = snapshot.docChanges.map((change) {
      return _decodeDocumentChange(
        change,
        UserEntityDocumentSnapshot._,
      );
    }).toList();

    return UserEntityQuerySnapshot._(
      snapshot,
      docs,
      docChanges,
    );
  }

  static FirestoreDocumentChange<UserEntityDocumentSnapshot>
      _decodeDocumentChange<T>(
    DocumentChange<T> docChange,
    UserEntityDocumentSnapshot Function(DocumentSnapshot<T> doc) decodeDoc,
  ) {
    return FirestoreDocumentChange<UserEntityDocumentSnapshot>(
      type: docChange.type,
      oldIndex: docChange.oldIndex,
      newIndex: docChange.newIndex,
      doc: decodeDoc(docChange.doc),
    );
  }

  final QuerySnapshot<UserEntity> snapshot;

  @override
  final List<UserEntityQueryDocumentSnapshot> docs;

  @override
  final List<FirestoreDocumentChange<UserEntityDocumentSnapshot>> docChanges;
}

class UserEntityQueryDocumentSnapshot
    extends FirestoreQueryDocumentSnapshot<UserEntity>
    implements UserEntityDocumentSnapshot {
  UserEntityQueryDocumentSnapshot._(this.snapshot) : data = snapshot.data();

  @override
  final QueryDocumentSnapshot<UserEntity> snapshot;

  @override
  final UserEntity data;

  @override
  UserEntityDocumentReference get reference {
    return UserEntityDocumentReference(snapshot.reference);
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserEntity _$UserEntityFromJson(Map<String, dynamic> json) => UserEntity(
      id: json['id'] as String,
      email: json['email'] as String?,
      photoUrl: json['photoUrl'] as String?,
      displayName: json['displayName'] as String?,
      createdOn: _$JsonConverterFromJson<Timestamp, DateTime>(
          json['createdOn'], const FirestoreDateTimeConverter().fromJson),
      linkedProviders: (json['linkedProviders'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toSet() ??
          const {},
      language: $enumDecodeNullable(_$LanguageEnumMap, json['language']) ??
          Language.en,
      isOnboarded: json['isOnboarded'] as bool? ?? false,
      pushPermission: $enumDecodeNullable(
              _$PushNotificationPermissionEnumMap, json['pushPermission']) ??
          PushNotificationPermission.notAsked,
    );

const _$UserEntityFieldMap = <String, String>{
  'id': 'id',
  'email': 'email',
  'displayName': 'displayName',
  'photoUrl': 'photoUrl',
  'linkedProviders': 'linkedProviders',
  'createdOn': 'createdOn',
  'language': 'language',
  'isOnboarded': 'isOnboarded',
  'pushPermission': 'pushPermission',
};

// ignore: unused_element
abstract class _$UserEntityPerFieldToJson {
  // ignore: unused_element
  static Object? id(String instance) => instance;
  // ignore: unused_element
  static Object? email(String? instance) => instance;
  // ignore: unused_element
  static Object? displayName(String? instance) => instance;
  // ignore: unused_element
  static Object? photoUrl(String? instance) => instance;
  // ignore: unused_element
  static Object? linkedProviders(Set<String> instance) => instance.toList();
  // ignore: unused_element
  static Object? createdOn(DateTime instance) =>
      const FirestoreDateTimeConverter().toJson(instance);
  // ignore: unused_element
  static Object? language(Language instance) => _$LanguageEnumMap[instance]!;
  // ignore: unused_element
  static Object? isOnboarded(bool instance) => instance;
  // ignore: unused_element
  static Object? pushPermission(PushNotificationPermission instance) =>
      _$PushNotificationPermissionEnumMap[instance]!;
}

Map<String, dynamic> _$UserEntityToJson(UserEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'displayName': instance.displayName,
      'photoUrl': instance.photoUrl,
      'linkedProviders': instance.linkedProviders.toList(),
      'createdOn':
          const FirestoreDateTimeConverter().toJson(instance.createdOn),
      'language': _$LanguageEnumMap[instance.language]!,
      'isOnboarded': instance.isOnboarded,
      'pushPermission':
          _$PushNotificationPermissionEnumMap[instance.pushPermission]!,
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);

const _$LanguageEnumMap = {
  Language.en: 'en',
  Language.hu: 'hu',
  Language.ro: 'ro',
  Language.it: 'it',
  Language.fr: 'fr',
  Language.de: 'de',
  Language.es: 'es',
};

const _$PushNotificationPermissionEnumMap = {
  PushNotificationPermission.granted: 'granted',
  PushNotificationPermission.provisional: 'provisional',
  PushNotificationPermission.notAsked: 'notAsked',
  PushNotificationPermission.deniedSystem: 'deniedSystem',
  PushNotificationPermission.deniedSettings: 'deniedSettings',
};
