import 'package:arenapredict/shared/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mode = ref.watch(themeModeProvider);
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        ListTile(title: const Text('Appearance'), subtitle: const Text('Theme mode')),
        SegmentedButton<ThemeMode>(
          segments: const [
            ButtonSegment(value: ThemeMode.system, label: Text('System'), icon: Icon(Icons.settings_suggest_outlined)),
            ButtonSegment(value: ThemeMode.light, label: Text('Light'), icon: Icon(Icons.light_mode_outlined)),
            ButtonSegment(value: ThemeMode.dark, label: Text('Dark'), icon: Icon(Icons.dark_mode_outlined)),
          ],
          selected: {mode},
          onSelectionChanged: (s) => ref.read(themeModeProvider.notifier).state = s.first,
        ),
        const SizedBox(height: 24),
        ListTile(title: const Text('Notifications'), subtitle: const Text('Interview demo only')),
        SwitchListTile(value: true, onChanged: (_) {}, title: const Text('Contest reminders')),
        SwitchListTile(value: false, onChanged: (_) {}, title: const Text('Leaderboard alerts')),
      ],
    );
  }
}
