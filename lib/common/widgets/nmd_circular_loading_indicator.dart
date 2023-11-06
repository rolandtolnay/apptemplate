import 'package:flutter/material.dart';

import '../extensions/build_context_extension.dart';

class NmdCircularLoadingIndicator extends StatelessWidget {
  const NmdCircularLoadingIndicator({super.key, this.color});

  final Color? color;

  @override
  Widget build(BuildContext context) {
    final color = this.color ?? context.nmdColor.primaryGreen;
    return Center(child: CircularProgressIndicator(color: color));
  }
}
