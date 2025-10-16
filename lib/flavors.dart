enum Flavor { development, staging, production }

class F {
  static late final Flavor appFlavor;

  static String get name => appFlavor.name;

  static String get title {
    switch (appFlavor) {
      case Flavor.development:
        return 'Flutter Dev App';
      case Flavor.staging:
        return 'Flutter Staging App';
      case Flavor.production:
        return 'Flutter App';
    }
  }

  static String get envFileName => '${appFlavor.name}.configs.json';
}
