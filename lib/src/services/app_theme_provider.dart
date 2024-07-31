import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_theme_provider.g.dart';

@Riverpod(keepAlive: true)
class AppTheme extends _$AppTheme {
  @override
  AppThemeMode build() {
    return AppThemeMode.light;
  }

  void changeTheme() {
    state = state == AppThemeMode.light ? AppThemeMode.dark : AppThemeMode.light;
  }
}

enum AppThemeMode { light, dark }
