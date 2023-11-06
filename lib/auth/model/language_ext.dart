import 'package:flutter/material.dart';

import '../../auth/model/user_entity.dart';

extension LanguageConfig on Language {
  Locale get locale {
    switch (this) {
      case Language.en:
        return const Locale('en');
      case Language.hu:
        return const Locale('hu');
      case Language.ro:
        return const Locale('ro');
      case Language.it:
        return const Locale('it');
      case Language.fr:
        return const Locale('fr');
      case Language.de:
        return const Locale('de');
      case Language.es:
        return const Locale('es');
    }
  }

  String get englishTitle {
    switch (this) {
      case Language.hu:
        return 'Hungarian';
      case Language.de:
        return 'German';
      case Language.en:
        return 'English';
      case Language.ro:
        return 'Romanian';
      case Language.it:
        return 'Italian';
      case Language.es:
        return 'Spanish';
      case Language.fr:
        return 'French';
    }
  }

  String get nativeTitle {
    switch (this) {
      case Language.hu:
        return 'Magyar';
      case Language.de:
        return 'Deutsch';
      case Language.en:
        return 'English';
      case Language.ro:
        return 'Română';
      case Language.it:
        return 'Italiano';
      case Language.es:
        return 'Español';
      case Language.fr:
        return 'Français';
    }
  }
}
