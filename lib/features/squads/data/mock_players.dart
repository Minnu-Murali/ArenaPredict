import 'package:arenapredict/features/predictions/models/player.dart';

// Simple football-style roles to keep it generic
final mockPlayers = <Player>[
  Player(id: 'P1', name: 'A. Silva', role: Role.forward, price: 12, proj: 48),
  Player(id: 'P2', name: 'M. Khan', role: Role.forward, price: 11, proj: 44),
  Player(id: 'P3', name: 'J. Müller', role: Role.midfielder, price: 10, proj: 40),
  Player(id: 'P4', name: 'L. Rossi', role: Role.midfielder, price: 9, proj: 36),
  Player(id: 'P5', name: 'S. Park', role: Role.midfielder, price: 8, proj: 30),
  Player(id: 'P6', name: 'R. Singh', role: Role.defender, price: 7.5, proj: 26),
  Player(id: 'P7', name: 'C. Brown', role: Role.defender, price: 7.0, proj: 24),
  Player(id: 'P8', name: 'N. Ito', role: Role.defender, price: 6.5, proj: 22),
  Player(id: 'P9', name: 'G. Costa', role: Role.goalkeeper, price: 6.0, proj: 18),
  Player(id: 'P10', name: 'Y. Chen', role: Role.forward, price: 9.5, proj: 32),
  Player(id: 'P11', name: 'E. Torres', role: Role.midfielder, price: 9.0, proj: 31),
  Player(id: 'P12', name: 'B. Ahmed', role: Role.defender, price: 6.0, proj: 20),
];
