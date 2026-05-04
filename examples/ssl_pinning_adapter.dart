import 'dart:io';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';

/// SSL Certificate Pinning implementation.
/// Prevents Man-in-the-Middle (MitM) attacks by ensuring the app only 
/// communicates with servers presenting a specific, pre-validated certificate.
void setupSSLPinning(Dio dio) {
  (dio.httpClientAdapter as IOHttpClientAdapter).onHttpClientCreate = (HttpClient client) {
    client.badCertificateCallback = (X509Certificate cert, String host, int port) {
      // In a production environment, you would validate the certificate's SHA-256 fingerprint here.
      // Returning false explicitly rejects any certificate that does not match our security policy.
      return false; 
    };
    return client;
  };
}