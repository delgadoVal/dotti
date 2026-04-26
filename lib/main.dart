import 'package:dotti/core/theme/app_theme.dart';
import 'package:dotti/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:window_manager/window_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await windowManager.ensureInitialized();

  windowManager.waitUntilReadyToShow(
    const WindowOptions(
      minimumSize: Size(800, 560),
      size: Size(1024, 680),
      center: true,
      titleBarStyle: TitleBarStyle.normal,
    ),
  );

  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'dotti',
      theme: AppTheme.light,
      routerConfig: appRouter,
    );
  }
}
