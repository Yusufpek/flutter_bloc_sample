import 'dart:convert';

import 'package:http/http.dart' as http;

import '../constants/extensions/base_url_extension.dart';
import '../models/information.dart';

class InformationRepository {
  static final String _username = 'kodlarinicinde';
  final String _baseUrl = _username.toBaseUrl();

  Future<Information> fetcInformations() async {
    final response = await http.get(Uri.parse(_baseUrl));
    if (response.statusCode == 200) {
      final jsonBody = json.decode(response.body);
      return Information.fromJson(jsonBody);
    } else {
      throw Exception("Status Code isn't 200 !");
    }
  }
}
