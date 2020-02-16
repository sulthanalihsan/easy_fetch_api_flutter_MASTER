import 'dart:convert';

import 'package:contoh/model/detail_meal.dart';
import 'package:http/http.dart' as http;

class Services {
  Future<DetailMeal> fetchDetail(String idMeal) async {
    try {
      var res = await http
          .get('https://www.themealdb.com/api/json/v1/1/lookup.php?i=$idMeal');

      if (res.statusCode == 200) {
        Map json = jsonDecode(res.body);
        DetailMeal data = DetailMeal.fromJson(json);
        return data;
      } else {
        throw Exception('Failed to load movie ${res.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to load movie');
    }
  }
}
