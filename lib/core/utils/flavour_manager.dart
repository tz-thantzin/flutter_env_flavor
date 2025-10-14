import 'dart:convert';

import 'package:flutter/services.dart';

import '../../flavors.dart';
import '../config/environment.dart';

class FlavorManager {
  static Environment? env;

  Future<FlavorManager> init(Flavor flavor) async {
    F.appFlavor = flavor;
    final configFile = await rootBundle.loadString(F.envFileName);
    env = Environment.fromJson(json.decode(configFile) as Map<String, dynamic>);
    return this;
  }
}
