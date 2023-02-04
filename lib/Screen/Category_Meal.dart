import 'package:basic03/Models/Meal.dart';
import 'package:basic03/Widjet/Mealitem.dart';
import 'package:flutter/material.dart';
import '../dummy_data.dart';

class CategoryMeal extends StatefulWidget {
  final List<Meal> available;

  static const String routName = "categorymeal";
  const CategoryMeal(this.available);

  @override
  _CategoryMealState createState() => _CategoryMealState();
}

class _CategoryMealState extends State<CategoryMeal> {
  String titlecategory = '';
  List<Meal> displaymeals = [];
  @override
  void didChangeDependencies() {
    final routArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final idcategory = routArgs['id'];
    titlecategory = routArgs['title']!;
    displaymeals = widget.available.where((element) {
      return element.categoris.contains(idcategory);
    }).toList();
    super.didChangeDependencies();
  }

  @override
  // ignore: must_call_super
  void initState() {}

  void voidi(String id) {
    setState(() {
      print(id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(titlecategory),
        ),
        body: ListView.builder(
            itemBuilder: (ctx, index) {
              return Mealitem(
                id: displaymeals[index].id,
                imageu: displaymeals[index].imageurl,
                title: displaymeals[index].title,
                affordability: displaymeals[index].affordability,
                complexcity: displaymeals[index].complexcity,
                duretion: displaymeals[index].duretion,
                ff: (String id) {
                  print(id);
                  setState(() {
                    displaymeals.removeWhere((element) => element.id == id);
                  });
                },
              );
            },
            itemCount: displaymeals.length));
  }
}
