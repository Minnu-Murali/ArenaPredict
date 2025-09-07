import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Card(
          child: ListTile(
            leading: const Icon(Icons.sports_esports),
            title: const Text('Welcome to ArenaPredict'),
            subtitle: const Text('Pick your fantasy lineup within budget. Track performance and explore analytics.'),
          ),
        ),
        const SizedBox(height: 12),
        Card(
          child: ListTile(
            leading: const Icon(Icons.lightbulb_outline),
            title: const Text('How it works'),
            subtitle: const Text('1) Join a contest  2) Build your lineup  3) Score points  4) Check leaderboard'),
          ),
        ),
        const SizedBox(height: 12),
        Wrap(spacing: 12, runSpacing: 12, children: [
          _QuickAction(icon: Icons.emoji_events_outlined, label: 'View Contests', onTap: () => context.go('/contests')),
          _QuickAction(icon: Icons.bar_chart_outlined, label: 'Analytics', onTap: () => context.go('/analytics')),
          _QuickAction(icon: Icons.leaderboard_outlined, label: 'Leaderboard', onTap: () => context.go('/leaderboard')),
        ]),
      ],
    );
  }
}

class _QuickAction extends StatelessWidget {
  const _QuickAction({required this.icon, required this.label, required this.onTap});
  final IconData icon; final String label; final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 180,
      child: Card(
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              Icon(icon, size: 28),
              const SizedBox(height: 8),
              Text(label, style: const TextStyle(fontWeight: FontWeight.w600)),
            ]),
          ),
        ),
      ),
    );
  }
}
