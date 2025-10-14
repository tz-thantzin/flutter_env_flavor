import 'package:flutter/material.dart';
import 'package:flutter_env_flavor/presentations/views/post_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'core/utils/flavour_manager.dart';
import 'flavors.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await FlavorManager().init(Flavor.production);
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: F.title,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Banner(
        location: BannerLocation.topStart,
        message: F.name,
        child: const PostPage(),
      ),
    );
  }
}
