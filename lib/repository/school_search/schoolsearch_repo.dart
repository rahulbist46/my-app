import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:edhippo/modal/search_school/search_school_modal.dart';

class SchoolSearchRepository {

  Future<List<SearchSchool>> fetchSearchSchoolsApi() async {
    try {
      final response = await http.post(
        Uri.parse('https://api.edhippo.com/api/school/list'),
        headers: <String, String>{

        },
        body: jsonEncode(<String, dynamic>{


          "page": 0,
          "limit":456

        }),
      );

      if (response.statusCode == 201) {
        if (kDebugMode) {
          print('Request successful');
        }
        if (kDebugMode) {
          print('Response: ${response.body}');
        }
        final Map<String, dynamic> responseBody = json.decode(response.body);

        return List<SearchSchool>.from(responseBody["data"]["schools"]
            .map((dynamic x) => SearchSchool.fromMap(x)));
      } else {
        throw Exception('Error: ${response.statusCode}');
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error: $e');
      }
      throw Exception('Error: $e');
    }
  }
}
