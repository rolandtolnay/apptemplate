import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../common/extensions/build_context_extension.dart';
import '../../common/use_gesture_recognizer.dart';
import '../../translations/locale_keys.g.dart';
import 'tap_gesture_recognizer_factory.dart';

class TermsAndPrivacyNoticeWidget extends HookConsumerWidget {
  const TermsAndPrivacyNoticeWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final privacyGr = useGestureRecognizer(
      () => TapGestureRecognizerFactory().makePrivacyTapRecognizer(),
    );
    final termsGr = useGestureRecognizer(
      () => TapGestureRecognizerFactory().makeTermsTapRecognizer(),
    );

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Text.rich(
        textAlign: TextAlign.center,
        TextSpan(
          style: context.nmdTypography.labelSmall.copyWith(
            color: const Color(0xff707070),
            fontSize: 11,
          ),
          children: [
            TextSpan(text: tr(LocaleKeys.auth_by_proceeding)),
            TextSpan(
              text: tr(LocaleKeys.auth_terms_conditions),
              style: const TextStyle(
                decoration: TextDecoration.underline,
              ),
              recognizer: termsGr,
            ),
            TextSpan(text: tr(LocaleKeys.auth_and_the)),
            TextSpan(
              text: tr(LocaleKeys.auth_privacy_policy),
              style: const TextStyle(
                decoration: TextDecoration.underline,
              ),
              recognizer: privacyGr,
            ),
            const TextSpan(text: '.'),
          ],
        ),
      ),
    );
  }
}
