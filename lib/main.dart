import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app.dart';
import 'core/utils/flavor_manager.dart';
import 'flavors.dart';

Future<void> main() async {
  /// RUN with $ flutter run --flavor production -t lib/main_prod.dart
  WidgetsFlutterBinding.ensureInitialized();

  await FlavorManager().init(F.appFlavor);

  runApp(const ProviderScope(child: App()));
}
