import 'package:flutter/material.dart';
import 'package:arenapredict/features/squads/data/mock_players.dart';
import 'package:arenapredict/features/predictions/models/player.dart';

class SquadsScreen extends StatelessWidget {
  const SquadsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: mockPlayers.length,
      itemBuilder: (context, i) {
        final p = mockPlayers[i];
        return Card(
          child: ListTile(
            leading: CircleAvatar(child: Text(p.name.substring(0,1))),
            title: Text(p.name),
            subtitle: Text('${_roleLabel(p.role)} · Price ${p.price.toStringAsFixed(1)} · Proj ${p.proj.toStringAsFixed(0)}'),
          ),
        );
      },
    );
  }

  String _roleLabel(Role r) => switch (r) { Role.forward => 'FWD', Role.midfielder => 'MID', Role.defender => 'DEF', Role.goalkeeper => 'GK' };
}
