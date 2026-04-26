import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class AnimationArea extends StatelessWidget {
  final AnimationController controller;
  final String animationAsset;

  const AnimationArea({
    required this.controller,
    required this.animationAsset,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: LottieBuilder.asset(
        animationAsset,
        controller: controller,
        onLoaded: (composition) {
          controller.duration = composition.duration;
        },
        fit: BoxFit.contain,
        width: double.infinity,
      ),
    );
  }
}
