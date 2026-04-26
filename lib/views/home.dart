import 'package:dotti/models/meditation.dart';
import 'package:flutter/material.dart';
import 'package:dotti/widgets/meditation_card.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          width: constraints.maxWidth,
          height: constraints.maxHeight,
          color: const Color(0xFFF2F2F2),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 48),
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
        );
      },
    );
  }
}
