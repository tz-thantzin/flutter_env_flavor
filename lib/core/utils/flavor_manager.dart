import 'dart:convert';

import 'package:flutter/services.dart';

import '../../flavors.dart';
import '../config/environment.dart';

class FlavorManager {
  static Environment? env;

  Future<FlavorManager> init(Flavor flavor) async {
    final configFile = await rootBundle.loadString(F.envFileName);
    env = Environment.fromJson(json.decode(configFile));
    return this;
  }
}
