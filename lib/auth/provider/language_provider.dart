import 'dart:developer' as dev;

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../auth/model/user_entity.dart';
import '../../auth/provider/user_provider.dart';
import '../../root/domain/injectable.dart';
import '../domain/profile_repository.dart';
import '../model/language_ext.dart';

final languageProvider = StateNotifierProvider<LanguageProvider, Language>(
  (ref) => LanguageProvider(getIt(), getIt(), ref),
);

class LanguageProvider extends StateNotifier<Language> {
  static const key = 'app_language';

  final SharedPreferences _prefs;
  final ProfileRepository _repository;
  final Ref _ref;

  LanguageProvider(this._prefs, this._repository, this._ref)
      : super(Language.from(_prefs.getString(key)) ?? Language.en);

  void setLanguage(Language language) {
    _prefs.setString(key, language.value);

    final user = _ref.read(userProvider);
    if (user != null) _repository.setLanguage(language, user: user);

    dev.log('Changed language to: ${language.nativeTitle}');
    state = language;
  }
}
