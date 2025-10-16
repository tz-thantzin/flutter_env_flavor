import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app.dart';
import 'core/utils/flavor_manager.dart';
import 'flavors.dart';

Future<void> main() async {
  /// RUN with $ flutter run --flavor production -t lib/main_prod.dart
  /// <OR>
  /// Open Run Configurations
  /// Go to the top toolbar in Android Studio.
  /// Click the dropdown next to the Run ▶️ button.
  /// Click “Edit Configurations…”
  /// Dart entrypoint  => lib/main_prod.dart
  /// The --flavor production goes into Additional run args.
  /// Click Apply, then OK.

  WidgetsFlutterBinding.ensureInitialized();

  await FlavorManager().init(F.appFlavor);

  runApp(const ProviderScope(child: App()));
}
