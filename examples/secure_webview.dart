import 'package:webview_flutter/webview_flutter.dart';

/// Secure WebView configuration with strict Allowlist and disabled JavaScript.
WebViewController getSecureController() {
  return WebViewController()
    ..setJavaScriptMode(JavaScriptMode.disabled)
    ..setNavigationDelegate(
      NavigationDelegate(
        onNavigationRequest: (NavigationRequest request) {
          if (request.url.startsWith('https://trusted-domain.com')) {
            return NavigationDecision.navigate;
          }
          return NavigationDecision.prevent; 
        },
      ),
    );
}