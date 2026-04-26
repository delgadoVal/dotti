import 'package:flutter/material.dart';

class PlayPauseButton extends StatelessWidget {
  final bool isPlaying;
  final VoidCallback onToggle;

  const PlayPauseButton({
    required this.isPlaying,
    required this.onToggle,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 8, offset: Offset(0, 2)),
        ],
      ),
      child: IconButton(
        iconSize: 32,
        icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow),
        onPressed: onToggle,
      ),
    );
  }
}
