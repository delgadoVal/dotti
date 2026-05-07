import 'package:dotti/core/theme/app_colors.dart';
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
                        colors: [AppColors.primarySoft, AppColors.accent],
                      ).createShader(bounds),
                      child: Text(
                        '¡Bien hecho!',
                        style: Theme.of(context).textTheme.titleMedium!
                            .copyWith(
                              fontSize: 32,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'Has terminado la práctica de $meditationTitle.',
                      style: Theme.of(context).textTheme.bodyMedium,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 32),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              WidgetStateProperty.resolveWith<Color>((states) {
                                if (states.contains(WidgetState.hovered)) {
                                  return AppColors.primary;
                                }
                                return AppColors.primarySoft;
                              }),
                          foregroundColor:
                              WidgetStateProperty.resolveWith<Color>((states) {
                                if (states.contains(WidgetState.hovered)) {
                                  return AppColors.textOnPrimary;
                                }
                                return AppColors.textOnPrimary;
                              }),
                          overlayColor: WidgetStateProperty.all(
                            Colors.transparent,
                          ),
                          shape: WidgetStateProperty.all(const StadiumBorder()),
                          padding: WidgetStateProperty.all(
                            const EdgeInsets.symmetric(vertical: 16),
                          ),
                        ),
                        onPressed: () => context.go('/'),
                        child: const Text('Continuar'),
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
