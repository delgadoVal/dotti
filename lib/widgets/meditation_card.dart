import 'package:dotti/models/meditation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MeditationCard extends ConsumerWidget {
  const MeditationCard(this.meditation, {super.key});

  final Meditation meditation;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      color: Colors.white,
      child: Expanded(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 16,
            right: 16,
            top: 16,
            bottom: 24,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    'assets/meditation.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Text(
                meditation.title,
                style: Theme.of(context).textTheme.titleMedium,
                textAlign: TextAlign.justify,
              ),
              const SizedBox(height: 8),
              Text(
                meditation.description,
                style: Theme.of(context).textTheme.bodySmall,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              Padding(
                padding: EdgeInsets.only(top: 16),
                child: Center(
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text('Reproducir'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
