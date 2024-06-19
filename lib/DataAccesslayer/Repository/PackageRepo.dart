import 'dart:convert';

import '../Clients/packageClient.dart';
import '../Models/package.dart';


class PackageRepo {
  PackageClient client = PackageClient();

  Future<List<Package>> getPackages() async {
    var response = await client.getPackages();
    if (response != '') {
      final parsed = json.decode(response).cast<Map<String, dynamic>>();
      return parsed.map<Package>((json) => Package.fromMap(json)).toList();
    }
    return [];
  }
  
    
}
