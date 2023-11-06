import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../translations/locale_keys.g.dart';
import '../haptic_provider.dart';
import 'button/nmd_large_gradient_button.dart';
import 'button/nmd_underline_button.dart';
import 'nmd_bottom_sheet.dart';
import 'nmd_modal_bottom_sheet.dart';

class NmdConfirmationSheet extends ConsumerWidget {
  const NmdConfirmationSheet({
    super.key,
    required this.description,
    required this.positiveTitle,
    required this.negativeTitle,
    this.inverted = false,
    this.underlineColor,
  });

  static Future<bool?> show(
    BuildContext context, {
    required String description,
    required String positiveTitle,
    required String negativeTitle,
    bool inverted = false,
    Color? underlineColor,
  }) {
    return showNmdModalBottomSheet<bool?>(
      context: context,
      builder: (_) => NmdConfirmationSheet(
        description: description,
        positiveTitle: positiveTitle,
        negativeTitle: negativeTitle,
        inverted: inverted,
        underlineColor: underlineColor,
      ),
    );
  }

  final String description;
  final String positiveTitle;
  final String negativeTitle;
  final Color? underlineColor;

  /// By default, gradient button is positive and underline button is negative.
  /// If `inverted` is true, gradient button is negative and underline button is positive.
  final bool inverted;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDefault = !inverted;

    return NmdBottomSheet(
      title: tr(LocaleKeys.common_are_you_sure),
      description: description,
      actions: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          NmdLargeGradientButton(
            title: isDefault ? positiveTitle : negativeTitle,
            onPressed: () {
              ref.watch(hapticProvider).feedback(HapticType.light);
              // ignore: avoid_bool_literals_in_conditional_expressions
              Navigator.of(context).pop(isDefault ? true : false);
            },
          ),
          const SizedBox(height: 16),
          NmdUnderlineButton(
            title: isDefault ? negativeTitle : positiveTitle,
            color: underlineColor,
            onPressed: () {
              ref.watch(hapticProvider).feedback(HapticType.light);
              // ignore: avoid_bool_literals_in_conditional_expressions
              Navigator.of(context).pop(isDefault ? false : true);
            },
          ),
        ],
      ),
    );
  }
}
