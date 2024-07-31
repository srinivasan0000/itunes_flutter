import '../features/home/presentation/search_page.dart';
import 'package:flutter_jailbreak_detection/flutter_jailbreak_detection.dart';

import '../features/home/presentation/filter_page.dart';
import '../features/home/presentation/home_screen.dart';
import '../features/splash/presentation/jail_brake_page.dart';
import '../features/splash/presentation/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'router.g.dart';
part 'route_enums.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();
@Riverpod(keepAlive: true)
GoRouter router(RouterRef ref) {
  return GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/splash',
    routes: [
      GoRoute(path: '/splash', name: Routes.splash.name, builder: (context, state) => const SplashScreen()),
      GoRoute(path: '/home', name: Routes.home.name, builder: (context, state) => const HomeScreen(), routes: [
        GoRoute(
            path: 'search',
            name: Routes.search.name,
            builder: (context, state) => const SearchPage(),
            routes: [GoRoute(path: 'filter', name: Routes.filter.name, builder: (context, state) => const FilterPage())]),
      ]),
      GoRoute(path: '/jailBrake', name: Routes.jailBrake.name, builder: (context, state) => const JailBrakePage()),
    ],
  );
}

@Riverpod(keepAlive: true)
Future<bool> isJailBroken(IsJailBrokenRef ref) async {
  return await FlutterJailbreakDetection.jailbroken;
}
