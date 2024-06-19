import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../Constants/api.dart';

class PackageClient {
  var client = http.Client();

  PackageClient();

  Future<dynamic> getPackages() async {
    var response = await client.get(Uri.parse(baseUrl + packages));

    if (response.statusCode == 200) {
      return response.body;
    } else {
      return '';
    }
  }

  
}
