enum Flavor { development, staging, production }

class F {
  static late Flavor appFlavor;

  static String get name => appFlavor.name;

  static String get envFileName {
    switch (appFlavor) {
      case Flavor.development:
        return 'assets/configs/development.configs.json';
      case Flavor.staging:
        return 'assets/configs/staging.configs.json';
      case Flavor.production:
        return 'assets/configs/production.configs.json';
    }
  }

  static String get title {
    switch (appFlavor) {
      case Flavor.development:
        return 'App Dev';
      case Flavor.staging:
        return 'App Staging';
      case Flavor.production:
        return 'App Prod';
    }
  }
}
