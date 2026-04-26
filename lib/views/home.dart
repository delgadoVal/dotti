import 'package:dotti/models/meditation.dart';
import 'package:flutter/material.dart';
import 'package:dotti/widgets/meditation_card.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  static const double _maxContentWidth = 1100;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFF2F2F2),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: _maxContentWidth),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 48),
            child: IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: meditations.values
                    .map(
                      (m) => Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: MeditationCard(m),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
