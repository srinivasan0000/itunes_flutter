import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:assessment_itunes/src/services/app_theme_provider.dart';

void main() {
  testWidgets('app theme provider changes theme mode', (tester) async {
    final container = ProviderContainer();
    addTearDown(container.dispose);

    expect(container.read(appThemeProvider), AppThemeMode.light);

    container.read(appThemeProvider.notifier).changeTheme();
    await tester.pump();

    expect(container.read(appThemeProvider), AppThemeMode.dark);

    container.read(appThemeProvider.notifier).changeTheme();
    await tester.pump();

    expect(container.read(appThemeProvider), AppThemeMode.light);
  });
}
