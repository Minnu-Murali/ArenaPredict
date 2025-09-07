import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ContestCard extends StatelessWidget {
  const ContestCard({super.key, required this.title, required this.prizePool, required this.entryFee, required this.entries, required this.maxEntries, this.onEnter});
  final String title; final double prizePool; final double entryFee; final int entries; final int maxEntries; final VoidCallback? onEnter;

  ContestCard copyWith({VoidCallback? onEnter}) => ContestCard(
    title: title, prizePool: prizePool, entryFee: entryFee, entries: entries, maxEntries: maxEntries, onEnter: onEnter ?? this.onEnter,
  );

  @override
  Widget build(BuildContext context) {
    final currency = NumberFormat.simpleCurrency();
    final progress = entries / maxEntries;
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(children: [
            const Icon(Icons.emoji_events_outlined),
            const SizedBox(width: 8),
            Text(title, style: Theme.of(context).textTheme.titleMedium),
            const Spacer(),
            Text('${currency.format(prizePool)} pool', style: const TextStyle(fontWeight: FontWeight.w600)),
          ]),
          const SizedBox(height: 8),
          Row(children: [
            Chip(label: Text('Entry ${currency.format(entryFee)}')),
            const SizedBox(width: 8),
            Chip(label: Text('$entries / $maxEntries joined')),
          ]),
          const SizedBox(height: 8),
          LinearProgressIndicator(value: progress),
          const SizedBox(height: 12),
          Align(
            alignment: Alignment.centerRight,
            child: FilledButton.icon(onPressed: onEnter, icon: const Icon(Icons.play_arrow), label: const Text('Enter')),
          )
        ]),
      ),
    );
  }
}
