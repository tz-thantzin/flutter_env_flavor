enum Flavor { dev, staging, prod }

class F {
  static late final Flavor appFlavor;

  static String get name => appFlavor.name;

  static String get title {
    switch (appFlavor) {
      case Flavor.dev:
        return 'Flutter Dev App';
      case Flavor.staging:
        return 'Flutter Staging App';
      case Flavor.prod:
        return 'Flutter App';
    }
  }
}
