import 'package:dotti/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:window_manager/window_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await windowManager.ensureInitialized();

  windowManager.waitUntilReadyToShow(
    const WindowOptions(
      minimumSize: Size(800, 550), // ancho mínimo para 3 cards cómodas
      size: Size(1024, 680), // tamaño inicial
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
      theme: ThemeData(scaffoldBackgroundColor: Colors.white),
      routerConfig: appRouter,
    );
  }
}
