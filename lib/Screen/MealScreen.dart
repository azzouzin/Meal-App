import 'package:basic03/Widjet/MainDrwer.dart';
import 'package:basic03/dummy_data.dart';
import 'package:flutter/material.dart';

class MealScreen extends StatelessWidget {
  static const String routName = "Screenmeal";
  final Function ismealfav;
  final Function togglefav;

  const MealScreen(
    this.togglefav,
    this.ismealfav,
  );

  @override
  Widget build(BuildContext context) {
    final mealid = ModalRoute.of(context)!.settings.arguments as String;
    final meal = DUMMY_MEALS.firstWhere((element) => element.id == mealid);

    // ignore: non_constant_identifier_names
    Widget Selected(
      BuildContext context,
      String nom,
      List list,
    ) {
      return Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            child: Text(
              nom,
              style: Theme.of(context).textTheme.headline1,
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            width: double.infinity,
            height: 175,
            decoration: BoxDecoration(
                color: Colors.black26,
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(10)),
            child: ListView.builder(
              itemBuilder: (context, index) {
                return Card(
                  color: Colors.black54,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: (5)),
                    child: Text(
                      list[index],
                      style: Theme.of(context).textTheme.headline6,
                    ),
                  ),
                );
              },
              itemCount: list.length,
            ),
          ),
        ],
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          meal.title,
          style: TextStyle(fontFamily: "Realway", fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(meal.imageurl)),
              ),
              Positioned(
                bottom: 20,
                right: 0,
                left: 0,
                child: Container(
                  color: Colors.black54,
                  width: 300,
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 50),
                  child: Text(
                    meal.title,
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w100),
                    softWrap: true,
                    overflow: TextOverflow.fade,
                  ),
                ),
              ),
            ]),
            Selected(context, "ingredient", meal.ingredient),
            Column(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    "Steps",
                    style: Theme.of(context).textTheme.headline1,
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 175,
                  decoration: BoxDecoration(
                      color: Colors.black26,
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(10)),
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.black54,
                            ),
                            child: ListTile(
                                leading: CircleAvatar(
                                  child: Text("${index + 1}"),
                                ),
                                title: Text(
                                  meal.steps[index],
                                  style: Theme.of(context).textTheme.headline6,
                                )),
                          ),
                          Divider(
                            color: Colors.white,
                          ),
                        ],
                      );
                    },
                    itemCount: meal.steps.length,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.yellow,
        onPressed: () {
          this.togglefav(mealid);
        },
        child: Icon(ismealfav(mealid) ? Icons.star : Icons.favorite_outline),
      ),
    );
  }
}
