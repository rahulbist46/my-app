import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../modal/school_board/school_board.dart';


class SchoolBoardRepository {
  Future<List<SchoolBoard>>fetchSchoolBoardApi() async {
    try {
      final response = await http.get(Uri.parse('https://api.edhippo.com/api/homepage/school-filters'));

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseBody = json.decode(response.body);



        return List< SchoolBoard>.from(
          responseBody["data"]['schoolBoards'].map(
                (dynamic x) => SchoolBoard.fromMap(x),
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
