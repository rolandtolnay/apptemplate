import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

typedef GestureRecognizerBuilder<T extends GestureRecognizer> = T Function();

T useGestureRecognizer<T extends GestureRecognizer>(
  GestureRecognizerBuilder<T> builder, [
  List<Object?>? keys,
]) {
  return use(_GestureRecognizerHook(builder: builder, keys: keys));
}

class _GestureRecognizerHook<T extends GestureRecognizer> extends Hook<T> {
  const _GestureRecognizerHook({required this.builder, super.keys});

  final GestureRecognizerBuilder<T> builder;

  @override
  HookState<T, Hook<T>> createState() => _GestureRecognizerHookState();
}

class _GestureRecognizerHookState<T extends GestureRecognizer>
    extends HookState<T, _GestureRecognizerHook<T>> {
  late final T recognizer = hook.builder();

  @override
  T build(BuildContext context) => recognizer;

  @override
  void dispose() => recognizer.dispose();

  @override
  String get debugLabel => 'useGestureRecognizer';
}
