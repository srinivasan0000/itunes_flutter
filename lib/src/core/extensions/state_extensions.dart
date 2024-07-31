import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

extension AsyncValueInspector on AsyncValue<dynamic> {
  String get toStr {
    final content = [
      if (isLoading && this is! AsyncLoading) 'isLoading: $isLoading',
      if (hasValue) 'value: $value',
      if (hasError) ...[
        'error: $error',
      ]
    ].join(', ');
    return '$runtimeType($content)';
  }

  String get props {
    return 'isLoading: $isLoading, isRefreshing: $isRefreshing, isReloading: $isReloading\nhasValue: $hasValue, hasError: $hasError';
  }
}

extension CachingExtension<T> on AutoDisposeRef<T> {
  void cacheFor(Duration duration) {
    final link = keepAlive();
    Timer timer = Timer(duration, link.close);
    onDispose(() {
      timer.cancel();
      link.close();
    });
  }

  void delayDispose(Duration duration) {
    final link = keepAlive();
    Timer? timer;
    onCancel(() => timer = Timer(duration, link.close));

    onResume(timer!.cancel);
    onDispose(timer!.cancel);
  }
}
