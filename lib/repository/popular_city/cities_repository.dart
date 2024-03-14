import 'dart:convert';
import 'package:edhippo/modal/city_modal/cities.dart';
import 'package:http/http.dart' as http;


class CitiesRepository {
  Future<List<CitiesModel>>fetchApi() async {
    try {
      final response = await http.get(Uri.parse('https://api.edhippo.com/api/homepage'));

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseBody = json.decode(response.body);



          return List< CitiesModel>.from(
              responseBody["data"]['popularCities'].map(
                    (dynamic x) => CitiesModel.fromMap(x),
              ),
          );




      } else {
        throw Exception('Error: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}
