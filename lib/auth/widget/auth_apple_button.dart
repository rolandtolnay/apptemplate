import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

import '../../common/haptic_provider.dart';
import '../../gen/fonts.gen.dart';
import '../provider/auth_credential_provider.dart';

const kAuthButtonHeight = 54.0;
const kAuthButtonIconScale = 28 / kAuthButtonHeight;
const kAuthButtonIconHeight = 24.0;

class AuthAppleButton extends ConsumerWidget {
  const AuthAppleButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const textWidget = Text(
      'Sign in with Apple',
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 17,
        fontWeight: FontWeight.w700,
        color: Colors.white,
        fontFamily: FontFamily.lato,
      ),
    );

    final icon = Container(
      width: kAuthButtonIconScale * kAuthButtonHeight,
      height: kAuthButtonIconScale * kAuthButtonHeight + 2,
      padding: const EdgeInsets.only(
        bottom: (4 / kAuthButtonHeight) * kAuthButtonHeight,
      ),
      child: const Center(
        child: SizedBox(
          width: kAuthButtonIconHeight * (25 / 31),
          height: kAuthButtonIconHeight,
          child: CustomPaint(painter: AppleLogoPainter(color: Colors.white)),
        ),
      ),
    );

    return SizedBox(
      height: kAuthButtonHeight,
      child: SizedBox.expand(
        child: CupertinoButton(
          borderRadius: BorderRadius.circular(16),
          padding: EdgeInsets.zero,
          color: Colors.black,
          onPressed: () {
            ref.read(hapticProvider).feedback(HapticType.light);
            ref.read(authCredentialProvider).signInWithApple();
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
