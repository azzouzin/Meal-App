import 'package:flutter/cupertino.dart';

enum Complexity {
  Challenging,
  Hard,
  Simple,
}
enum Affordability {
  Pricey,
  Affordable,
  Luxurious,
}

class Meal {
  final String id;
  final List<String> categoris;
  final String imageurl;
  final List<String> ingredient;
  final String title;
  final List<String> steps;
  final int duretion;
  final bool isglutFree;
  final bool isLactostFree;
  final bool isvegan;
  final Affordability affordability;
  final Complexity complexcity;
  final bool isvegetarien;

  const Meal(
    this.id,
    this.categoris,
    this.title,
    this.affordability,
    this.complexcity,
    this.imageurl,
    this.duretion,
    this.ingredient,
    this.steps,
    this.isglutFree,
    this.isvegan,
    this.isvegetarien,
    this.isLactostFree,
  );
}
