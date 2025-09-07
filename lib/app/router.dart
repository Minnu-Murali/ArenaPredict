import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:arenapredict/core/widgets/app_scaffold.dart';
import 'package:arenapredict/features/home/presentation/home_screen.dart';
import 'package:arenapredict/features/contests/presentation/contests_screen.dart';
import 'package:arenapredict/features/analytics/presentation/analytics_screen.dart';
import 'package:arenapredict/features/leaderboard/presentation/leaderboard_screen.dart';
import 'package:arenapredict/features/settings/presentation/settings_screen.dart';
import 'package:arenapredict/features/predictions/presentation/predictions_screen.dart';

final _rootKey = GlobalKey<NavigatorState>();
final _shellKey = GlobalKey<NavigatorState>();

final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    navigatorKey: _rootKey,
    initialLocation: '/home',
    routes: [
      ShellRoute(
        navigatorKey: _shellKey,
        builder: (context, state, child) => AppScaffold(child: child),
        routes: [
          GoRoute(path: '/home', name: 'home', pageBuilder: (c, s) => const NoTransitionPage(child: HomeScreen())),
          GoRoute(path: '/contests', name: 'contests', pageBuilder: (c, s) => const NoTransitionPage(child: ContestsScreen())),
          GoRoute(path: '/analytics', name: 'analytics', pageBuilder: (c, s) => const NoTransitionPage(child: AnalyticsScreen())),
          GoRoute(path: '/leaderboard', name: 'leaderboard', pageBuilder: (c, s) => const NoTransitionPage(child: LeaderboardScreen())),
          GoRoute(path: '/settings', name: 'settings', pageBuilder: (c, s) => const NoTransitionPage(child: SettingsScreen())),
          GoRoute(path: '/predictions', name: 'predictions', pageBuilder: (c, s) => const NoTransitionPage(child: PredictionsScreen())),
        ],
      ),
    ],
  );
});
