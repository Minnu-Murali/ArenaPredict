class EmbedConfig {
  EmbedConfig.public({required this.publicEmbedUrl})
      : reportId = null,
        secureEmbedUrl = null,
        accessToken = null;

  EmbedConfig.secure({required this.reportId, required this.secureEmbedUrl, required this.accessToken})
      : publicEmbedUrl = null;

  final String? publicEmbedUrl; // Use this for Publish-to-web demos
  final String? reportId;       // Secure embedding
  final String? secureEmbedUrl; // e.g., https://app.powerbi.com/reportEmbed?reportId=...&groupId=...
  final String? accessToken;    // Embed token
}

class PowerBIService {
  Future<EmbedConfig> fetchDemoConfig() async {
    // Replace with your Publish-to-web URL for a quick demo.
    return EmbedConfig.public(publicEmbedUrl: 'https://app.powerbi.com/view?r=YOUR_PUBLISH_TO_WEB_TOKEN');
  }

  // For secure embedding, replace with a network call to your backend.
  Future<EmbedConfig> fetchSecureConfig() async {
    return EmbedConfig.secure(
      reportId: 'YOUR_REPORT_ID',
      secureEmbedUrl: 'https://app.powerbi.com/reportEmbed?reportId=YOUR_REPORT_ID&groupId=YOUR_WORKSPACE_ID',
      accessToken: 'YOUR_EMBED_TOKEN',
    );
  }
}
