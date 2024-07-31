import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: '.env')
abstract class Env {
  @EnviedField(varName: 'AllowedShaFingerPrint', obfuscate: true)
  static String allowedShaFingerPrintRaw = _Env.allowedShaFingerPrintRaw;

  static List<String> get allowedShaFingerPrint => allowedShaFingerPrintRaw.split(',').map((e) => e.trim()).toList();
}
