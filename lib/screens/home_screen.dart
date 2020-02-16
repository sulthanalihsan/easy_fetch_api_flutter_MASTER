import 'dart:convert';

import 'package:contoh/model/meals.dart';
import 'package:contoh/ui/item_meals.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'detail_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<Meals> responseFilter;

  Future<Meals> fetchDataMeals() async {
    String url = 'https://www.themealdb.com/api/json/v1/1/filter.php?c=Seafood';
    try {
      var res = await http.get(url);
      if (res.statusCode == 200) {
        Map json = jsonDecode(res.body);
        Meals data = Meals.fromJson(json);
        return data;
      } else {
        throw Exception('Failed to load movie ${res.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to load movie');
    }
  }

  @override
  void initState() {
    super.initState();
    responseFilter = fetchDataMeals();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Receipe Apps'),
      ),
      body: FutureBuilder(
        future: responseFilter,
        builder: (BuildContext context, AsyncSnapshot<Meals> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.meals.length,
              itemBuilder: (BuildContext context, int index) {
                var itemMeal = snapshot.data.meals[index];
                return InkWell(
                  splashColor: Colors.lightBlue,
                  child: itemMeals(
                    itemMeal.idMeal,
                    itemMeal.strMeal,
                    itemMeal.strMealThumb,
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                DetailScreen(idMeal: itemMeal.idMeal)));
                  },
                );
              },
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
