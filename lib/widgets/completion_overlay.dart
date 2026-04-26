import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:go_router/go_router.dart';

class CompletionOverlay extends StatelessWidget {
  final String meditationTitle;

  final String _checkAnimationAsset = 'assets/animations/check.json';

  const CompletionOverlay({required this.meditationTitle, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black.withOpacity(0.3),
      child: Center(
        child: SizedBox(
          width: 400,
          child: Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.topCenter,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 80),
                decoration: BoxDecoration(
                  color: const Color(0xFFF0F0F8),
                  borderRadius: BorderRadius.circular(24),
                ),
                padding: const EdgeInsets.only(
                  top: 100,
                  left: 32,
                  right: 32,
                  bottom: 40,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ShaderMask(
                      shaderCallback: (bounds) => const LinearGradient(
                        colors: [Color(0xFFB2B9FB), Color(0xFFFFAE88)],
                      ).createShader(bounds),
                      child: const Text(
                        '¡Bien hecho!',
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'Has terminado la práctica de $meditationTitle.',
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.black54,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 32),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFB3B3F5),
                          foregroundColor: Colors.white,
                          shape: const StadiumBorder(),
                          padding: const EdgeInsets.symmetric(vertical: 16),
                        ),
                        onPressed: () => context.go('/'),
                        child: const Text(
                          'Continuar',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              Container(
                width: 200,
                height: 200,
                clipBehavior: Clip.antiAlias,
                decoration: const BoxDecoration(shape: BoxShape.circle),
                child: Lottie.asset(
                  _checkAnimationAsset,
                  fit: BoxFit.cover,
                  repeat: false,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
