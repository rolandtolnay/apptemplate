import '../prince_of_versions.dart';
import 'remote_config_value.dart';

enum RemoteConfigKey {
  privacyUrl,
  termsUrl,
  princeOfVersions;

  String get storageKey {
    return switch (this) {
      RemoteConfigKey.privacyUrl => 'privacy_url',
      RemoteConfigKey.termsUrl => 'terms_url',
      RemoteConfigKey.princeOfVersions => 'prince_of_versions',
    };
  }

  // TODO(developer): Add default terms and privacy url's
  RemoteConfigValue<dynamic> get defaultValue {
    return switch (this) {
      RemoteConfigKey.privacyUrl => RemoteConfigValueString(
          'https://termly.io/products/privacy-policy-generator/',
        ),
      RemoteConfigKey.termsUrl => RemoteConfigValueString(
          'https://termly.io/products/terms-and-conditions-generator/',
        ),
      RemoteConfigKey.princeOfVersions =>
        RemoteConfigValueJson(PrinceOfVersions.none().toJson()),
    };
  }
}
