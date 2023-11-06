import 'package:flutter/material.dart';

extension ListDivider on Iterable<Widget> {
  Iterable<Widget> divide(Widget separator) sync* {
    if (isEmpty) return;

    final iterator = this.iterator..moveNext();
    yield iterator.current;
    while (iterator.moveNext()) {
      yield separator;
      yield iterator.current;
    }
  }
}
