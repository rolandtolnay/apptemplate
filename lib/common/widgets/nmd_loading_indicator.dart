import 'package:flutter/cupertino.dart';

import '../extensions/build_context_extension.dart';

class NmdLoadingIndicator extends StatelessWidget {
  const NmdLoadingIndicator({super.key, this.color});

  final Color? color;

  @override
  Widget build(BuildContext context) {
    final color = this.color ?? context.nmdColor.primaryGreen;

    return Center(child: CupertinoActivityIndicator(color: color));
  }
}
