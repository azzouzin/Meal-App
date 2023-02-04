import 'dart:ui';

import 'package:basic03/Models/Category.dart';
import 'package:basic03/Models/Meal.dart';
import 'package:basic03/Screen/CategoryScreen.dart';
import 'package:basic03/Screen/Category_Meal.dart';
import 'package:basic03/Screen/Filters_Screen.dart';
import 'package:basic03/Screen/MealScreen.dart';

import 'package:basic03/Screen/TabsScreen.dart';
import 'package:basic03/dummy_data.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> filters = {
    'glutfree': false,
    'lactosfree': false,
    'isvegan': false,
    'isvegetarian': false,
  };

  List<Meal> available = DUMMY_MEALS;
  List<Meal> favorite = [];
  void save(Map<String, bool> filtersss) {
    setState(() {
      available = DUMMY_MEALS.where((element) {
        filters = filtersss;
        if (filtersss['glutfree'] == true && !element.isglutFree) {
          return false;
        }
        if (filtersss['lactosfree'] == true && !element.isLactostFree) {
          return false;
        }
        if (filtersss['isvegan'] == true && !element.isvegan) {
          return false;
        }
        if (filtersss['isvegetarian'] == true && !element.isvegetarien) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void togglefav(String id) {
    var indexx = favorite.indexWhere((element) => element.id == id);

    setState(() {
      if (indexx >= 0) {
        {
          favorite.removeAt(indexx);
        }
      } else {
        favorite.add(DUMMY_MEALS.firstWhere((element) => element.id == id));
      }
    });
  }

  bool ismealfav(String id) {
    return favorite.any((element) => element.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.pink,
          accentColor: Color(0xff6C5B7B),
          canvasColor: Colors.white,
          splashColor: Color(0xffF67280).withOpacity(1),
          textTheme: ThemeData.light().textTheme.copyWith(
                bodyText1: TextStyle(
                    color: Colors.white,
                    fontFamily: "Roboto",
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
                bodyText2: TextStyle(
                    color: Colors.white,
                    fontFamily: "Roboto",
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
                headline6: TextStyle(
                    color: Colors.white,
                    fontFamily: "Raleway",
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
                headline1: TextStyle(
                    color: Color(0xffF8B195),
                    fontFamily: "Raleway",
                    fontSize: 40,
                    fontWeight: FontWeight.bold),
              )),
      home: TabsScreen(favorite, togglefav, ismealfav),
      routes: {
        TabsScreen.routName: (context) =>
            TabsScreen(favorite, togglefav, ismealfav),
        CategoryMeal.routName: (context) => CategoryMeal(available),
        MealScreen.routName: (context) => MealScreen(togglefav, ismealfav),
        Filters_Screen.routName: (context) => Filters_Screen(filters, save),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
