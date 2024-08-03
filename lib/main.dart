import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'src/app.dart';
import 'src/core/utils/provider_observer.dart';

void main() {
  runApp(const ProviderScope(observers: [ProviderLogger()], child: MyApp()));
}

// .env file in root folder has shakey for ssl pinning
// analysis_options.yaml has all practiced linting rules for the project
// you need to run flutter pub run build_runner build --delete-conflicting-outputs to generate the freezed, riverpod files, assets files

// ─src
//     ├───core
//     │   ├───assets
//     │   ├───env
//     │   ├───extensions
//     │   ├───networking
//     │   └───utils
//     ├───features
//     │   ├───common_widgets
//     │   ├───home
//     │   │   ├───data
//     │   │   └───presentation
//     │   │       ├───states
//     │   │       └───widgets
//     │   └───splash
//     │       └───presentation
//     ├───route_management
//     └───services
