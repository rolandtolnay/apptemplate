import 'package:json_annotation/json_annotation.dart';

part 'prince_of_versions.g.dart';

@JsonSerializable(explicitToJson: true)
class PrinceOfVersions {
  final PlatformVersionConfig? android;
  final PlatformVersionConfig? ios;

  PrinceOfVersions(this.android, this.ios);

  factory PrinceOfVersions.none() => PrinceOfVersions(null, null);

  factory PrinceOfVersions.fromJson(Map<String, dynamic> json) =>
      _$PrinceOfVersionsFromJson(json);

  Map<String, dynamic> toJson() => _$PrinceOfVersionsToJson(this);
}

@JsonSerializable()
class PlatformVersionConfig {
  final String? lastVersion;
  final String? requiredVersion;
  final String? versionName;
  final String? installUrl;

  PlatformVersionConfig(
    this.lastVersion,
    this.requiredVersion,
    this.versionName,
    this.installUrl,
  );

  factory PlatformVersionConfig.fromJson(Map<String, dynamic> json) =>
      _$PlatformVersionConfigFromJson(json);

  Map<String, dynamic> toJson() => _$PlatformVersionConfigToJson(this);
}
