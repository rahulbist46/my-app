import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../modal/category_modal/school_types.dart';


class SchoolTypeRepository {

  Future<List<SchoolType>> fetchSchoolTypeData() async {
    try {
      final response = await http.get(
          Uri.parse('https://api.edhippo.com/api/homepage/school-filters'));

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseBody = json.decode(response.body);

        return List<SchoolType>.from(
          responseBody["data"]["schoolTypes"].map(
                (dynamic x) => SchoolType.fromMap(x),
          ),
        );
      } else {
        throw http.ClientException('Error: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}