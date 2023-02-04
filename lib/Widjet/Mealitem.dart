import 'dart:ffi';

import '../Models/Meal.dart';
import '../Screen/MealScreen.dart';
import 'package:flutter/material.dart';

class Mealitem extends StatelessWidget {
  final String id;
  final Function ff;
  final String imageu;
  final String title;
  final Affordability affordability;
  final Complexity complexcity;
  final int duretion;

  const Mealitem({
    required this.imageu,
    required this.title,
    required this.affordability,
    required this.complexcity,
    required this.duretion,
    required this.id,
    required this.ff,
  });

  String get mealafo {
    switch (affordability) {
      case Affordability.Affordable:
        return "Affordable";
      case Affordability.Luxurious:
        return "Luxurious";

      case Affordability.Pricey:
        return "Pricey";
    }
  }

  String get mealComp {
    switch (complexcity) {
      case Complexity.Hard:
        return "Hard";
        break;
      case Complexity.Challenging:
        return "Challenging";
        break;

      case Complexity.Simple:
        return "Simple";
        break;
    }
  }

  void selectMeal(BuildContext context) {
    Navigator.of(context)
        .pushNamed(
      MealScreen.routName,
      arguments: id,
    )
        .then((r) {
      // ignore: unnecessary_statements
      if (r != null) {
        ff(r);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
        borderRadius: BorderRadius.circular(25),
        onTap: () => selectMeal(context),
        child: Card(
          elevation: 4,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
          child: Column(
            children: [
              Stack(children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25),
                  ),
                  child: Image.network(
                    imageu,
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 0,
                  child: Container(
                    color: Colors.black54,
                    width: 300,
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: Text(
                      title,
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.w100),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                ),
              ]),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 11),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.schedule),
                          Text(" $duretion min",
                              style: TextStyle(
                                color: Colors.black,
                              )),
                        ],
                      ),
                      Row(children: [
                        Icon(Icons.cases_outlined),
                        Text(mealComp,
                            style: TextStyle(
                              color: Colors.black,
                            ))
                      ]),
                      Row(children: [
                        Icon(
                          Icons.attach_money,
                        ),
                        Text(mealafo,
                            style: TextStyle(
                              color: Colors.black,
                            ))
                      ]),
                    ]),
              ),
            ],
          ),
        ));
  }
}
