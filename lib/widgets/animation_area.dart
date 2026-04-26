import 'package:flutter/material.dart';

class AnimationArea extends StatelessWidget {
  const AnimationArea({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Container(
        width: double.infinity,
        color: Colors.grey[200],
        // child: LottieBuilder.asset(...)
      ),
    );
  }
}
