import 'package:flutter/material.dart';

class LeaderboardScreen extends StatelessWidget {
  const LeaderboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final leaders = const [
      ('TheStrategist', 312),
      ('GoalGuru', 298),
      ('MidfieldMaestro', 281),
      ('DefenderPro', 260),
    ];

    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: leaders.length,
      separatorBuilder: (_, __) => const SizedBox(height: 8),
      itemBuilder: (context, i) {
        final (name, pts) = leaders[i];
        return Card(
          child: ListTile(
            leading: CircleAvatar(child: Text('${i + 1}')),
            title: Text(name),
            trailing: Text('$pts pts', style: const TextStyle(fontWeight: FontWeight.w600)),
          ),
        );
      },
    );
  }
}
