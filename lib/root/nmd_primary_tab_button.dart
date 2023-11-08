import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../common/widgets/decorated_tappable.dart';
import '../common/extensions/build_context_extension.dart';
import '../common/haptic_provider.dart';

class NmdPrimaryTabButton extends ConsumerWidget {
  const NmdPrimaryTabButton({super.key, this.elevation = 0});

  final double elevation;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const size = 56.0;
    return DecoratedTappable(
      onTap: () {
        ref.read(hapticProvider).feedback(HapticType.light);
        // TODO(developer): Implement primary action
      },
      width: size,
      height: size,
      elevation: elevation,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(size),
        gradient: context.nmdColor.primaryGradient,
        boxShadow: const [
          BoxShadow(
            color: Color(0x5777B6AC),
            offset: Offset(2, 3),
            blurRadius: 26,
          ),
        ],
      ),
      child: const Center(
        child: Icon(Icons.add, size: 24, color: Colors.white),
      ),
    );
  }
}
