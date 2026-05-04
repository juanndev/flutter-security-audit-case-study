import 'package:flutter_secure_storage/flutter_secure_storage.dart';

/// Secure storage implementation using Hardware-Backed Encryption (KeyStore/Keychain).
class SecureVault {
  static const _storage = FlutterSecureStorage();

  static Future<void> storeToken(String token) async {
    await _storage.write(
      key: 'session_token', 
      value: token,
      aOptions: const AndroidOptions(encryptedSharedPreferences: true),
    );
  }

  static Future<String?> getToken() async {
    return await _storage.read(key: 'session_token');
  }

  static Future<void> clearVault() async {
    await _storage.delete(key: 'session_token');
  }
}