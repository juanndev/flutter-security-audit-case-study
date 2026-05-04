import 'package:flutter_secure_storage/flutter_secure_storage.dart';

/// Secure storage implementation using Hardware-Backed Encryption.
/// 
/// This class replaces insecure persistence methods (like standard SharedPreferences) 
/// with platform-specific secure enclaves: KeyStore for Android and Keychain for iOS.
class SecureVault {
  // Instance of the secure storage plugin
  static const _storage = FlutterSecureStorage();

  /// Securely writes a sensitive token to the device's secure enclave.
  static Future<void> storeToken(String token) async {
    await _storage.write(
      key: 'session_token', 
      value: token,
      // Ensures Android uses EncryptedSharedPreferences for added security
      aOptions: const AndroidOptions(encryptedSharedPreferences: true),
    );
  }

  /// Reads the securely stored token. Returns null if not found.
  static Future<String?> getToken() async {
    return await _storage.read(key: 'session_token');
  }

  /// Deletes the stored token (e.g., during logout).
  static Future<void> clearVault() async {
    await _storage.delete(key: 'session_token');
  }
}