// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prince_of_versions.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PrinceOfVersions _$PrinceOfVersionsFromJson(Map<String, dynamic> json) =>
    PrinceOfVersions(
      json['android'] == null
          ? null
          : PlatformVersionConfig.fromJson(
              json['android'] as Map<String, dynamic>),
      json['ios'] == null
          ? null
          : PlatformVersionConfig.fromJson(json['ios'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PrinceOfVersionsToJson(PrinceOfVersions instance) =>
    <String, dynamic>{
      'android': instance.android?.toJson(),
      'ios': instance.ios?.toJson(),
    };

PlatformVersionConfig _$PlatformVersionConfigFromJson(
        Map<String, dynamic> json) =>
    PlatformVersionConfig(
      json['lastVersion'] as String?,
      json['requiredVersion'] as String?,
      json['versionName'] as String?,
      json['installUrl'] as String?,
    );

Map<String, dynamic> _$PlatformVersionConfigToJson(
        PlatformVersionConfig instance) =>
    <String, dynamic>{
      'lastVersion': instance.lastVersion,
      'requiredVersion': instance.requiredVersion,
      'versionName': instance.versionName,
      'installUrl': instance.installUrl,
    };
