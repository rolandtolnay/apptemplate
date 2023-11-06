import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../common/haptic_provider.dart';
import '../../gen/assets.gen.dart';
import '../../gen/fonts.gen.dart';
import '../provider/auth_credential_provider.dart';
import 'auth_apple_button.dart';

class AuthGoogleButton extends ConsumerWidget {
  const AuthGoogleButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const textWidget = Text(
      'Sign in with Google',
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 17,
        fontWeight: FontWeight.w700,
        color: Color.fromRGBO(0, 0, 0, 0.9),
        fontFamily: FontFamily.lato,
      ),
    );

    final icon = SizedBox(
      width: kAuthButtonIconScale * kAuthButtonHeight,
      height: kAuthButtonIconScale * kAuthButtonHeight + 2,
      child: Center(
        child: SizedBox(
          width: kAuthButtonIconHeight * (25 / 31),
          height: kAuthButtonIconHeight,
          child: Assets.images.googleLogo.svg(),
        ),
      ),
    );

    return SizedBox(
      height: kAuthButtonHeight,
      child: SizedBox.expand(
        child: CupertinoButton(
          borderRadius: BorderRadius.circular(16),
          padding: EdgeInsets.zero,
          color: const Color(0xffe6e6e6),
          onPressed: () {
            ref.read(hapticProvider).feedback(HapticType.light);
            ref.read(authCredentialProvider).signInWithGoogle();
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            height: kAuthButtonHeight,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                icon,
                const Expanded(child: textWidget),
                const SizedBox(width: kAuthButtonIconScale * kAuthButtonHeight),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
