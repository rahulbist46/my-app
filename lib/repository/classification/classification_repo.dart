import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../modal/classification/classification_modal.dart';


class SchoolBoardStateRepository {
  Future<List<SchoolClassification>>schoolClassificationApi() async {
    try {
      final response = await http.get(Uri.parse('https://api.edhippo.com/api/homepage/school-filters'));

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseBody = json.decode(response.body);



        return List< SchoolClassification>.from(
          responseBody["data"]['schoolClassifications'].map(
                (dynamic x) => SchoolClassification.fromMap(x),
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
