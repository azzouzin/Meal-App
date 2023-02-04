import 'package:basic03/Models/Meal.dart';
import 'package:basic03/Widjet/Mealitem.dart';
import 'package:flutter/material.dart';

class FavoriteScreen extends StatelessWidget {
  final List<Meal> favorite;
  final Function ismealfav;
  final Function togglefav;

  const FavoriteScreen(this.favorite, this.togglefav, this.ismealfav);
  @override
  Widget build(BuildContext context) {
    return Center(
        child: favorite.isEmpty
            ? Text("Your fav list is empety start add some ?")
            : ListView.builder(
                itemBuilder: (ctx, index) {
                  return Mealitem(
                    id: favorite[index].id,
                    imageu: favorite[index].imageurl,
                    title: favorite[index].title,
                    affordability: favorite[index].affordability,
                    complexcity: favorite[index].complexcity,
                    duretion: favorite[index].duretion,
                    ff: (String id) {
                      print(id);
                    },
                  );
                },
                itemCount: favorite.length));
  }
}
