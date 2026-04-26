import 'package:flutter/material.dart';

class ProgressSlider extends StatelessWidget {
  final double currentSeconds;
  final double totalSeconds;
  final ValueChanged<double> onSeek;
  final String Function(double) formatTime;

  const ProgressSlider({
    required this.currentSeconds,
    required this.totalSeconds,
    required this.onSeek,
    required this.formatTime,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Slider(
          value: currentSeconds,
          min: 0,
          max: totalSeconds,
          onChanged: onSeek,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(formatTime(currentSeconds)),
              Text(formatTime(totalSeconds)),
            ],
          ),
        ),
      ],
    );
  }
}
