import 'package:webview_flutter/webview_flutter.dart';

/// Secure WebView configuration to mitigate JS Injection and Phishing risks.
/// 
/// This controller implements a strict Allowlist for domains and disables 
/// JavaScript by default to reduce the attack surface within the application.
WebViewController getSecureController() {
  return WebViewController()
    ..setJavaScriptMode(JavaScriptMode.disabled) // Keep disabled unless absolutely necessary
    ..setNavigationDelegate(
      NavigationDelegate(
        onNavigationRequest: (NavigationRequest request) {
          // Strict Navigation Policy: Only allow requests to the trusted enterprise domain.
          if (request.url.startsWith('https://trusted-domain.com')) {
            return NavigationDecision.navigate;
          }
          // Blocks any unauthorized or suspicious navigation attempts.
          return NavigationDecision.prevent; 
        },
      ),
    );
}