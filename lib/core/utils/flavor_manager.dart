import 'dart:convert';

import 'package:flutter/services.dart';

import '../../flavors.dart';
import '../config/environment.dart';

class FlavorManager {
  static Environment? env;

  Future<FlavorManager> init(Flavor flavor) async {
    F.appFlavor = flavor;
    final configFile = await rootBundle.loadString(_getConfigPath(flavor));
    env = Environment.fromJson(json.decode(configFile));
    return this;
  }

  String _getConfigPath(Flavor flavor) {
    switch (flavor) {
      case Flavor.dev:
        return 'assets/configs/development.configs.json';
      case Flavor.staging:
        return 'assets/configs/staging.configs.json';
      case Flavor.prod:
        return 'assets/configs/production.configs.json';
    }
  }
}
