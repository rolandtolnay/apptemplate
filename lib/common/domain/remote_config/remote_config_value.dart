// ignore_for_file: strict_raw_type, avoid_positional_boolean_parameters

sealed class RemoteConfigValue<T> {
  T get value;
}

class RemoteConfigValueInt extends RemoteConfigValue {
  @override
  final int value;

  RemoteConfigValueInt(this.value);
}

class RemoteConfigValueBool extends RemoteConfigValue {
  @override
  final bool value;

  RemoteConfigValueBool(this.value);
}

class RemoteConfigValueDouble extends RemoteConfigValue {
  @override
  final double value;

  RemoteConfigValueDouble(this.value);
}

class RemoteConfigValueString extends RemoteConfigValue {
  @override
  final String value;

  RemoteConfigValueString(this.value);
}

class RemoteConfigValueJson extends RemoteConfigValue {
  @override
  final Map<String, dynamic> value;

  RemoteConfigValueJson(this.value);
}
