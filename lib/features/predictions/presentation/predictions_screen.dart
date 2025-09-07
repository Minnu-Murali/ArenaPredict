import 'package:arenapredict/features/predictions/models/player.dart';
import 'package:arenapredict/features/predictions/providers/lineup_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PredictionsScreen extends ConsumerWidget {
  const PredictionsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final players = ref.watch(allPlayersProvider);
    final lineup = ref.watch(lineupProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Build Your Lineup')),
      body: Column(children: [
        _LineupSummary(remaining: lineup.remaining, projected: lineup.projectedTotal, count: lineup.selected.length),
        const Divider(height: 1),
        Expanded(
          child: ListView.builder(
            itemCount: players.length,
            itemBuilder: (context, i) {
              final p = players[i];
              final selected = lineup.selected.any((e) => e.id == p.id);
              return ListTile(
                leading: CircleAvatar(child: Text(p.name.substring(0, 1))),
                title: Text(p.name),
                subtitle: Text('${_roleLabel(p.role)} · Price ${p.price.toStringAsFixed(1)} · Proj ${p.proj.toStringAsFixed(0)}'),
                trailing: Icon(selected ? Icons.check_circle : Icons.add_circle_outline, color: selected ? Colors.green : null),
                onTap: () {
                  final notifier = ref.read(lineupProvider.notifier);
                  final before = lineup.selected.length;
                  notifier.toggle(p);
                  final after = ref.read(lineupProvider).selected.length;
                  if (after == before && !selected) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Cannot add: budget/role/limit reached')));
                  }
                },
              );
            },
          ),
        ),
      ]),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(children: [
            Expanded(child: OutlinedButton.icon(onPressed: () => ref.read(lineupProvider.notifier).clear(), icon: const Icon(Icons.refresh), label: const Text('Reset'))),
            const SizedBox(width: 12),
            Expanded(child: FilledButton.icon(onPressed: lineup.selected.length == 11 ? () {
              showDialog(context: context, builder: (_) => const _SavedDialog());
            } : null, icon: const Icon(Icons.save), label: const Text('Save Entry'))),
          ]),
        ),
      ),
    );
  }

  String _roleLabel(Role r) => switch (r) { Role.forward => 'FWD', Role.midfielder => 'MID', Role.defender => 'DEF', Role.goalkeeper => 'GK' };
}

class _LineupSummary extends StatelessWidget {
  const _LineupSummary({required this.remaining, required this.projected, required this.count});
  final double remaining; final double projected; final int count;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.surfaceVariant,
      padding: const EdgeInsets.all(12),
      child: Row(children: [
        const Icon(Icons.wallet_outlined), const SizedBox(width: 8), Text('Remaining: ${remaining.toStringAsFixed(1)}'),
        const SizedBox(width: 16), const Icon(Icons.trending_up_outlined), const SizedBox(width: 8), Text('Projected: ${projected.toStringAsFixed(0)}'),
        const Spacer(), Chip(label: Text('$count / 11 selected')),
      ]),
    );
  }
}

class _SavedDialog extends StatelessWidget {
  const _SavedDialog();
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Entry Saved'),
      content: const Text('Your lineup has been saved for the contest!'),
      actions: [ TextButton(onPressed: () => Navigator.pop(context), child: const Text('OK')) ],
    );
  }
}
