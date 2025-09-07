import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PowerBIWebView extends StatefulWidget {
  const PowerBIWebView({super.key, this.publicUrl, this.secureUrl, this.accessToken});
  final String? publicUrl;     // Publish-to-web URL
  final String? secureUrl;     // reportEmbed URL
  final String? accessToken;   // embed token (not used in demo HTML, see notes)

  @override
  State<PowerBIWebView> createState() => _PowerBIWebViewState();
}

class _PowerBIWebViewState extends State<PowerBIWebView> {
  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..addJavaScriptChannel('FlutterChannel', onMessageReceived: (msg) {})
      ..loadFlutterAsset('assets/powerbi_embed.html');

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final cfg = {
        'publicUrl': widget.publicUrl,
        'secureUrl': widget.secureUrl,
        'accessToken': widget.accessToken,
      };
      await _controller.runJavaScript('window.setEmbedConfig(${jsonEncode(cfg)});');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SizedBox(
        height: 360,
        child: WebViewWidget(controller: _controller),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          IconButton(
            tooltip: 'Reload',
            onPressed: () async {
              final cfg = {
                'publicUrl': widget.publicUrl,
                'secureUrl': widget.secureUrl,
                'accessToken': widget.accessToken,
              };
              await _controller.runJavaScript('window.setEmbedConfig(${jsonEncode(cfg)});');
            },
            icon: const Icon(Icons.refresh),
          ),
        ],
      )
    ]);
  }
}
