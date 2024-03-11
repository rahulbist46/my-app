import 'dart:convert';
import 'package:http/http.dart'as http;
import 'package:edhippo/modal/cities.dart';

class CitiesRepository {
  Future<List<CitiesModel>> fetchApi() async {
    try {
      final response = await http.get(Uri.parse('https://api.edhippo.com/api/homepage'));

      if (response.statusCode == 200) {
        final List<dynamic> body = json.decode(response.body);

        return body.map((dynamic e) {
          return CitiesModel(
            id: e['id'],
            city: e['city'] as String,
            country: e['country'] as String,
            state: e['state'],
            icon: e['icon'],
          );
        }).toList();
      } else {
        throw Exception('Error: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}
