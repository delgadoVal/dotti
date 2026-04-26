import 'package:dotti/views/home.dart';
import 'package:dotti/views/meditation_page.dart';
import 'package:dotti/views/splash_screen.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  initialLocation: '/splash',
  routes: [
    GoRoute(path: '/splash', builder: (context, state) => const SplashScreen()),
    GoRoute(path: '/', builder: (context, state) => const Home()),
    GoRoute(
      path: '/meditation',
      builder: (context, state) => const MeditationPage(),
    ),
  ],
);
