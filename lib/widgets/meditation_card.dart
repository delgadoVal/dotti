import 'package:flutter/material.dart';

class MeditationCard extends StatelessWidget {
  const MeditationCard({super.key});

  @override
  Widget build(BuildContext context) {
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
                'Respiración 4-7-8',
                style: Theme.of(context).textTheme.titleMedium,
                textAlign: TextAlign.justify,
              ),
              const SizedBox(height: 8),
              Text(
                'Práctica para calmar el sistema nervioso...',
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
