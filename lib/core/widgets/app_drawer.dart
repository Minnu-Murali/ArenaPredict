import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              margin: EdgeInsets.zero,
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [Colors.indigo, Colors.deepPurple]),
              ),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Text('ArenaPredict', style: TextStyle(fontSize: 22, color: Colors.white, fontWeight: FontWeight.w700)),
              ),
            ),
            ListTile(leading: const Icon(Icons.home_outlined), title: const Text('Home'), onTap: () => context.go('/home')),
            ListTile(leading: const Icon(Icons.emoji_events_outlined), title: const Text('Contests'), onTap: () => context.go('/contests')),
            ListTile(leading: const Icon(Icons.bar_chart_outlined), title: const Text('Analytics'), onTap: () => context.go('/analytics')),
            ListTile(leading: const Icon(Icons.leaderboard_outlined), title: const Text('Leaderboard'), onTap: () => context.go('/leaderboard')),
            ListTile(leading: const Icon(Icons.settings_outlined), title: const Text('Settings'), onTap: () => context.go('/settings')),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.info_outline),
              title: const Text('About'),
              onTap: () {
                showAboutDialog(
                  context: context,
                  applicationName: 'ArenaPredict',
                  applicationVersion: '1.0.0',
                  applicationLegalese: '© 2025 Candidate',
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
