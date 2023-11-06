import 'package:flutter/material.dart';

import '../extensions/build_context_extension.dart';

class DetailRow extends StatelessWidget {
  const DetailRow({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
  });

  final Widget icon;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        icon,
        const SizedBox(width: 8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(label, style: context.nmdTypography.label),
              const SizedBox(height: 8),
              Text(
                value,
                style: context.nmdTypography.subtitleSmall,
                softWrap: false,
              ),
            ],
          ),
        ),
        const SizedBox(width: 8),
      ],
    );
  }
}
