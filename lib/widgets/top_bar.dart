import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class TopBar extends StatelessWidget {
  final String title;
  final bool isAudioEnabled;
  final VoidCallback onAudioToggle;

  const TopBar({
    required this.title,
    required this.isAudioEnabled,
    required this.onAudioToggle,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 8,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: IconButton(
            icon: const Icon(Icons.chevron_left),
            onPressed: () => context.go('/'),
          ),
        ),
        Text(title, style: Theme.of(context).textTheme.titleLarge),
        Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 8,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: IconButton(
            icon: Icon(isAudioEnabled ? Icons.volume_up : Icons.volume_off),
            onPressed: onAudioToggle,
          ),
        ),
      ],
    );
  }
}
