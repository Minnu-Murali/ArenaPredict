import 'package:flutter/material.dart';
import 'package:arenapredict/features/contests/widgets/contest_card.dart';
import 'package:go_router/go_router.dart';

class ContestsScreen extends StatelessWidget {
  const ContestsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final contests = [
      const ContestCard(title: 'Weekend Classic', prizePool: 5000, entryFee: 10, entries: 250, maxEntries: 1000),
      const ContestCard(title: 'Midweek Sprint', prizePool: 2000, entryFee: 5, entries: 120, maxEntries: 500),
      const ContestCard(title: 'High Roller', prizePool: 12000, entryFee: 50, entries: 40, maxEntries: 250),
    ];

    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: contests.length,
      separatorBuilder: (_, __) => const SizedBox(height: 12),
      itemBuilder: (context, i) {
        return contests[i].copyWith(onEnter: () => context.go('/predictions'));
      },
    );
  }
}
