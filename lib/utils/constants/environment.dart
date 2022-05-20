abstract class Environment {
  static const String env = String.fromEnvironment('FLAVOR');
  static const String buildNumber = String.fromEnvironment('BUILD_NUMBER');
}
