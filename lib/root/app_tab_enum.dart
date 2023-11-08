import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:riverpod/riverpod.dart';

import '../translations/locale_keys.g.dart';

final appTabProvider = StateProvider<AppTab>((_) => AppTab.explore);

enum AppTab {
  explore,
  profile;

  // TODO(developer): Implement tabs
  Widget buildWidget() {
    switch (this) {
      case AppTab.explore:
        return Center(child: Text(tr(LocaleKeys.root_explore)));
      case AppTab.profile:
        return Center(child: Text(tr(LocaleKeys.root_profile)));
    }
  }

  Widget buildIcon({required Color color, double size = 24.0}) {
    return switch (this) {
      AppTab.explore => Icon(key: ValueKey('$name-tab-icon'), Icons.explore),
      AppTab.profile => Icon(key: ValueKey('$name-tab-icon'), Icons.person)
    };
  }

  String get text {
    switch (this) {
      case AppTab.explore:
        return tr(LocaleKeys.root_explore);
      case AppTab.profile:
        return tr(LocaleKeys.root_profile);
    }
  }
}
