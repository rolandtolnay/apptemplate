import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:logging/logging.dart';

import '../../common/domain/firestore_serializable_annotation.dart';
import '../../common/push_notification/push_notification_repository.dart';

part 'user_entity.g.dart';

Logger _log = Logger('$UserEntity');

@Collection<UserEntity>('users')
final usersRef = UserEntityCollectionReference();

@firestoreSerializable
class UserEntity {
  final String id;

  final String? email;
  final String? displayName;
  final String? photoUrl;

  final Set<String> linkedProviders;

  final DateTime createdOn;
  final Language language;
  final bool isOnboarded;

  final PushNotificationPermission pushPermission;

  UserEntity({
    required this.id,
    required this.email,
    this.photoUrl,
    this.displayName,
    DateTime? createdOn,
    this.linkedProviders = const {},
    this.language = Language.en,
    this.isOnboarded = false,
    this.pushPermission = PushNotificationPermission.notAsked,
  }) : createdOn = createdOn ?? DateTime.now();

  UserEntity copyWith({
    Language? language,
    bool? isOnboarded,
    PushNotificationPermission? pushPermission,
  }) =>
      UserEntity(
        id: id,
        email: email,
        photoUrl: photoUrl,
        displayName: displayName,
        linkedProviders: linkedProviders,
        createdOn: createdOn,
        language: language ?? this.language,
        isOnboarded: isOnboarded ?? this.isOnboarded,
        pushPermission: pushPermission ?? this.pushPermission,
      );

  UserEntity linkWithProvider({
    required String providerId,
    String? email,
    String? displayName,
    String? photoUrl,
  }) {
    return UserEntity(
      id: id,
      email: email ?? this.email,
      photoUrl: photoUrl ?? this.photoUrl,
      displayName: displayName ?? this.displayName,
      createdOn: createdOn,
      language: language,
      isOnboarded: isOnboarded,
      linkedProviders: {...linkedProviders, providerId},
      pushPermission: pushPermission,
    );
  }

  @override
  String toString() {
    return 'UserEntity(id: $id, language: $language)';
  }

  bool get isAdmin => kIsWeb;

  bool get isAnonymous => linkedProviders.isEmpty;
}

@JsonEnum(alwaysCreate: true)
enum Language {
  en,
  hu,
  ro,
  it,
  fr,
  de,
  es;

  String get value => _$LanguageEnumMap[this]!;

  static Language? from(String? value) {
    if (value == null) return null;

    final parsed = $enumDecodeNullable(
      _$LanguageEnumMap,
      value,
      unknownValue: JsonKey.nullForUndefinedEnumValue,
    );
    if (parsed == null) {
      _log.severe('[ERROR] Unexpected $Language value: $value');
    }
    return parsed;
  }

  static Language? fromLocale(String? locale) {
    if (locale == null) return null;

    final parsed = $enumDecodeNullable(
      _$LanguageEnumMap,
      locale.substring(0, 2),
      unknownValue: JsonKey.nullForUndefinedEnumValue,
    );
    if (parsed == null) {
      _log.severe('[ERROR] Unexpected $Language locale: $locale');
    }
    return parsed;
  }
}
