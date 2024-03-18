import 'dart:convert';

import 'package:edhippo/modal/FeaturedSchoolsmodal/featuredSchools.dart';
import 'package:http/http.dart' as http;




class FeaturedSchoolsRepository{

  Future<List<FeaturedSchools>>fetchFeaturedSchoolsData()async{
    try{

      final response =await http.get(Uri.parse('https://api.edhippo.com/api/homepage'));

      if(response.statusCode==200){

        final Map<String,dynamic>responseBody=json.decode(response.body);

        return List<FeaturedSchools>.from(
            responseBody["data"]["featuredSchools"].map(
                (dynamic x)=> FeaturedSchools.fromMap(x)
            ));

      }else {
        throw Exception('Error: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}
