import 'package:contoh/model/detail_meal.dart';
import 'package:contoh/network/services.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatefulWidget {
  final String idMeal;

  DetailScreen({this.idMeal});

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  Services service = Services();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail Receipe"),
      ),
      body: Center(
        child: FutureBuilder<DetailMeal>(
          future: service.fetchDetail(widget.idMeal),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var detailMeal = snapshot.data.meals[0];
              return SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    GestureDetector(
                      child: Center(
                        child: Hero(
                          child: Material(
                            child: Image.network(detailMeal['strMealThumb']),
                          ),
                          tag: '${detailMeal['idMeal']}',
                        ),
                      ),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(child: Text('${detailMeal['strMeal']}')),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(child: Text('Instructions')),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                          child: Text('${detailMeal['strInstructions']}')),
                    ),
                  ],
                ),
              );
            } else {
              return CircularProgressIndicator(
                backgroundColor: Colors.orange,
                strokeWidth: 5,
              );
            }
          },
        ),
      ),
    );
  }
}
