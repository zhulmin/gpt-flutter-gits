
enum EnvType {
  dev,test,release,
}

class EnvConfig {

  static String baseUrl = "";
  static EnvType envType = EnvType.dev;
  static bool shouldCollectCrashLog = true;
  static int okCode = 0;

  //static int tokenInvaliedCode = 8401;
}