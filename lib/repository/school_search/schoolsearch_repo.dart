import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:edhippo/modal/search_school/search_school_modal.dart';

class SchoolSearchRepository {

  Future<List<SearchSchool>> fetchSearchSchoolsApi() async {
    try {
      final response = await http.post(
        Uri.parse('https://api.edhippo.com/api/school/list'),
        headers: <String, String>{},
        body: jsonEncode(<String, dynamic>{

          "limit": 100
        }),
      );

      if (response.statusCode == 201) {
        print('Request successful');
        print('Response: ${response.body}');
        final Map<String, dynamic> responseBody = json.decode(response.body);

        return List<SearchSchool>.from(responseBody["data"]["schools"]
            .map((dynamic x) => SearchSchool.fromMap(x)));
      } else {
        throw Exception('Error: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}
