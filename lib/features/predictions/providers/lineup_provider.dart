import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:arenapredict/features/predictions/models/player.dart';
import 'package:arenapredict/features/squads/data/mock_players.dart';

class LineupState {
  LineupState({required this.budget, required this.selected});
  final double budget; // total budget
  final List<Player> selected;

  double get spent => selected.fold(0, (s, p) => s + p.price);
  double get remaining => budget - spent;
  double get projectedTotal => selected.fold(0, (s, p) => s + p.proj);
}

class LineupNotifier extends StateNotifier<LineupState> {
  LineupNotifier(): super(LineupState(budget: 100, selected: []));

  static const maxPlayers = 11;
  static const roleLimits = {
    Role.forward: 3,
    Role.midfielder: 5,
    Role.defender: 4,
    Role.goalkeeper: 1,
  };

  bool canAdd(Player p) {
    if (state.selected.length >= maxPlayers) return false;
    if (state.remaining < p.price) return false;
    final countByRole = <Role, int>{};
    for (final pl in state.selected) {
      countByRole.update(pl.role, (v) => v + 1, ifAbsent: () => 1);
    }
    final current = countByRole[p.role] ?? 0;
    final limit = roleLimits[p.role] ?? 99;
    return current + 1 <= limit;
  }

  void toggle(Player p) {
    final isSelected = state.selected.any((e) => e.id == p.id);
    if (isSelected) {
      state = LineupState(budget: state.budget, selected: state.selected.where((e) => e.id != p.id).toList());
    } else {
      if (canAdd(p)) {
        state = LineupState(budget: state.budget, selected: [...state.selected, p]);
      }
    }
  }

  void clear() => state = LineupState(budget: state.budget, selected: []);
}

final allPlayersProvider = Provider<List<Player>>((ref) => mockPlayers);
final lineupProvider = StateNotifierProvider<LineupNotifier, LineupState>((ref) => LineupNotifier());
