import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';

import '../../modal/school_details/details_modal.dart';

class SchoolDetailsRepository {
  Future<List<DetailsModal>> fetchDetailApi(String schoolId) async {
    try {
      final response = await http.get(
          Uri.parse('https://api.edhippo.com/api/school/65f3f84b560c55ab3195db46'));

      if (response.statusCode == 200) {
        if (kDebugMode) {
          print('Request successful');
          print('Response: ${response.body}');
        }

        final Map<String, dynamic> responseBody = json.decode(response.body);

        return List<DetailsModal>.from(responseBody["data"]
            .map((dynamic x) => DetailsModal.fromMap(x)));

      } else {
        throw Exception('Error: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}