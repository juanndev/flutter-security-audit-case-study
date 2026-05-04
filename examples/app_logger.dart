import 'package:flutter/foundation.dart';

/// Conditional Logging Utility to prevent PII (Personally Identifiable Information) 
/// leakage in production environments.
class AppLogger {
  /// Logs data only in Debug mode. 
  /// In Release mode, the compiler effectively ignores this block, 
  /// ensuring sensitive debug information is never exposed to end-users.
  static void securityLog(String data) {
    if (kDebugMode) {
      // This will only execute during development
      print('SECURITY_DEBUG: $data');
    }
  }
}