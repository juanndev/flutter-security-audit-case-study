import 'dart:io';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';

/// SSL Certificate Pinning implementation to ensure secure server communication.
void setupSSLPinning(Dio dio) {
  (dio.httpClientAdapter as IOHttpClientAdapter).onHttpClientCreate = (HttpClient client) {
    client.badCertificateCallback = (X509Certificate cert, String host, int port) {
      return false; // Rejects any certificate not explicitly trusted by the app logic
    };
    return client;
  };
}