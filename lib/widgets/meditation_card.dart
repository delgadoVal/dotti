import 'package:dotti/core/theme/app_colors.dart';
import 'package:dotti/models/meditation.dart';
import 'package:dotti/providers/meditation_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class MeditationCard extends ConsumerWidget {
  const MeditationCard(this.meditation, {super.key});

  final Meditation meditation;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      color: Colors.white,
      elevation: 8,
      shadowColor: Colors.black26,
      child: Padding(
        padding: const EdgeInsets.only(
          left: 16,
          right: 16,
          top: 16,
          bottom: 24,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            // Image
            AspectRatio(
              aspectRatio: 4 / 3,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(meditation.imagePath, fit: BoxFit.cover),
              ),
            ),
            const SizedBox(height: 20),

            // Title
            Text(
              meditation.title,
              style: Theme.of(
                context,
              ).textTheme.titleMedium!.copyWith(fontSize: 20),
            ),
            const SizedBox(height: 8),

            // Description
            Text(
              meditation.description,
              style: Theme.of(
                context,
              ).textTheme.bodyMedium?.copyWith(color: Colors.grey[600]),
            ),

            // Spacer
            const Spacer(),
            const SizedBox(height: 20),

            // Button
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primarySoft,
                foregroundColor: AppColors.textOnPrimary,
                shape: const StadiumBorder(),
                padding: const EdgeInsets.symmetric(vertical: 14),
              ),
              onPressed: () {
                ref.read(selectedMeditationProvider.notifier).state =
                    meditation;
                context.go('/meditation');
              },
              child: const Text('Reproducir'),
            ),
          ],
        ),
      ),
    );
  }
}
