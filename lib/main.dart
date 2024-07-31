import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'src/app.dart';
import 'src/core/utils/provider_observer.dart';

void main() {
  runApp(const ProviderScope(observers: [ProviderLogger()], child: MyApp()));
}
