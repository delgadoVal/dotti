// lib/features/splash/splash_screen.dart
import 'package:dotti/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:lottie/lottie.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _fadeController;
  late Animation<double> _fadeAnimation;
  late AnimationController _lottieController;
  final AudioPlayer _audioPlayer = AudioPlayer();

  @override
  void initState() {
    super.initState();

    _fadeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _fadeAnimation = CurvedAnimation(
      parent: _fadeController,
      curve: Curves.easeIn,
    );

    _lottieController = AnimationController(vsync: this);
    _fadeController.forward();
    _iniciarSplash();
  }

  Future<void> _iniciarSplash() async {
    try {
      await _audioPlayer.setAsset('assets/audio/splash.mp3');
      _audioPlayer.play();
    } catch (e) {
      debugPrint('Audio error: $e');
    }

    await Future.doWhile(() async {
      await Future.delayed(const Duration(milliseconds: 50));
      return _lottieController.duration == null;
    });

    await _lottieController.forward();

    await Future.delayed(const Duration(milliseconds: 300));

    await _fadeController.reverse();

    if (mounted) {
      context.go('/');
    }
  }

  @override
  void dispose() {
    _fadeController.dispose();
    _lottieController.dispose();
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FadeTransition(
        opacity: _fadeAnimation,
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [AppColors.primarySoft, AppColors.primary],
            ),
          ),
          child: Center(
            child: Lottie.asset(
              'assets/animations/splash.json',
              controller: _lottieController,
              width: 280,
              height: 280,
              repeat: false,
              onLoaded: (composition) {
                _lottieController.duration = composition.duration;
              },
            ),
          ),
        ),
      ),
    );
  }
}
