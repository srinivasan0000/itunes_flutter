import '../../../core/assets/assets.gen.dart';
import '../../../core/extensions/material_extensions.dart';
import '../../../route_management/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    super.initState();
    initMethod();
  }

  Future<void> initMethod() async {
    final isJailBroken = await ref.read(isJailBrokenProvider.future);
    if (isJailBroken) {
      ref.read(routerProvider).goNamed(Routes.jailBrake.name);
    } else {
      ref.read(routerProvider).goNamed(Routes.jailBrake.name);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: context.colorTheme.surfaceBright,
        child: Center(
          child: Image.asset(Assets.logos.logo.path),
        ),
      ),
    );
  }
}
