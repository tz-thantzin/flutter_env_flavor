import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';

class NetworkUtil {
  static Future<bool> isNetworkAvailable() async {
    try {
      // Check connectivity type (WiFi, Mobile, Ethernet)
      final connectivityResults = await (Connectivity().checkConnectivity());

      // No network connectivity
      if (connectivityResults.isEmpty ||
          connectivityResults.contains(ConnectivityResult.none)) {
        return false;
      }

      // Perform a simple DNS lookup to verify internet access
      final result = await InternetAddress.lookup('google.com');
      return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } catch (_) {
      return false;
    }
  }
}
