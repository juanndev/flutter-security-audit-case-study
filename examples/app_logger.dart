import 'package:flutter/foundation.dart';

/// Conditional Logging Utility to prevent PII (Personally Identifiable Information) 
/// leakage in production environments.
class AppLogger {
  /// Logs data only in Debug mode. 
  /// In Release mode, the compiler effectively ignores this block.
  static void securityLog(String data) {
    if (kDebugMode) {
      print('SECURITY_DEBUG: $data');
    }
  }
}