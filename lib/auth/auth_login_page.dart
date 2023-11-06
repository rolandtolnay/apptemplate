import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../common/analytics/use_analytics_track_screen.dart';
import '../common/request_state.dart';
import '../common/widgets/button/nmd_floating_icon_button.dart';
import '../common/widgets/nmd_scaffold.dart';
import '../common/widgets/nmd_toast.dart';
import '../translations/locale_keys.g.dart';
import 'model/user_entity.dart';
import 'provider/auth_credential_provider.dart';
import 'provider/user_provider.dart';
import 'widget/auth_apple_button.dart';
import 'widget/auth_google_button.dart';
import 'widget/terms_and_privacy_notice_widget.dart';

class AuthLoginPage extends HookConsumerWidget {
  const AuthLoginPage({
    super.key,
    this.onSuccessfulLogin,
    this.canClose = true,
  });

  static Route<dynamic> route({
    bool canClose = true,
    void Function(BuildContext, UserEntity)? onSuccessfulLogin,
  }) {
    return MaterialPageRoute(
      builder: (_) => AuthLoginPage(
        onSuccessfulLogin: onSuccessfulLogin,
        canClose: canClose,
      ),
      fullscreenDialog: true,
    );
  }

  final bool canClose;
  final void Function(BuildContext, UserEntity)? onSuccessfulLogin;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useAnalyticsTrackScreen('$AuthLoginPage');

    _listenOnUserAuthenticated(ref, context);

    final user = ref.watch(userProvider);
    return NmdScaffold(
      automaticallyImplyLeading: false,
      trailing: user != null && canClose ? const FloatingCloseButton() : null,
      title: tr(LocaleKeys.auth_sign_in),
      loadingOverlay: ref.watch(authCredentialProvider).state.isLoading,
      body: const Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Spacer(),
          Spacer(),
          AuthAppleButton(),
          SizedBox(height: 8),
          AuthGoogleButton(),
          SizedBox(height: 32),
          TermsAndPrivacyNoticeWidget(),
          SizedBox(height: 8),
        ],
      ),
    );
  }

  void _listenOnUserAuthenticated(WidgetRef ref, BuildContext context) {
    ref.listen(authCredentialProvider, (_, next) {
      next.state.whenOrNull(
        success: (user) {
          if (user == null) return;
          Navigator.of(context).pop();
          onSuccessfulLogin?.call(context, user);
        },
        failure: (e) => NmdToast.showError(context, e),
      );
    });
  }
}

extension RefEnsureLoggedIn on WidgetRef {
  void ensureLoggedIn(
    void Function(BuildContext, UserEntity) callback, {
    bool canClose = true,
  }) {
    final user = read(userProvider);
    if (user == null) return;

    if (user.isAnonymous) {
      Navigator.of(context).push(
        AuthLoginPage.route(onSuccessfulLogin: callback, canClose: canClose),
      );
    } else {
      callback(context, user);
    }
  }
}
