import 'package:flutter/material.dart';
import 'package:arenapredict/features/analytics/services/powerbi_service.dart';
import 'package:arenapredict/features/analytics/widgets/powerbi_webview.dart';

class AnalyticsScreen extends StatefulWidget {
  const AnalyticsScreen({super.key});
  @override
  State<AnalyticsScreen> createState() => _AnalyticsScreenState();
}

class _AnalyticsScreenState extends State<AnalyticsScreen> {
  final _service = PowerBIService();
  bool _secure = false; // toggle between demo(public) and secure mock
  EmbedConfig? _cfg;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    final cfg = _secure ? await _service.fetchSecureConfig() : await _service.fetchDemoConfig();
    setState(() => _cfg = cfg);
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Row(children: [
          const Icon(Icons.bar_chart_outlined),
          const SizedBox(width: 8),
          Text('Analytics', style: Theme.of(context).textTheme.titleLarge),
          const Spacer(),
          Switch.adaptive(value: _secure, onChanged: (v) => setState(() { _secure = v; _load(); })),
          const SizedBox(width: 6),
          const Text('Secure (mock)')
        ]),
        const SizedBox(height: 12),
        if (_cfg == null)
          const Center(child: Padding(padding: EdgeInsets.all(24), child: CircularProgressIndicator()))
        else
          PowerBIWebView(
            publicUrl: _cfg!.publicEmbedUrl,
            secureUrl: _cfg!.secureEmbedUrl,
            accessToken: _cfg!.accessToken,
          ),
        const SizedBox(height: 12),
        const Text('Notes:'),
        const Text('• For quick demo, paste a Publish-to-web URL into PowerBIService.fetchDemoConfig().\n• For production, switch to secure embedding via your backend.'),
      ],
    );
  }
}
