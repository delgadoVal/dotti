import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class TopBar extends StatelessWidget {
  final String title;
  final bool isBellEnabled;
  final VoidCallback onBellToggle;

  const TopBar({
    required this.title,
    required this.isBellEnabled,
    required this.onBellToggle,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          icon: const Icon(Icons.chevron_left),
          onPressed: () => context.go('/'),
        ),
        Text(title, style: Theme.of(context).textTheme.titleLarge),
        IconButton(
          icon: Icon(isBellEnabled ? Icons.volume_up : Icons.volume_off),
          onPressed: onBellToggle,
        ),
      ],
    );
  }
}
