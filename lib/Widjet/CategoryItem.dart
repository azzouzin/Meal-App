import 'package:basic03/Screen/Category_Meal.dart';
import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem(this.id, this.title, this.color, this.imgurl);
  @required
  final String id;
  @required
  final String title;
  @required
  final Color color;
  @required
  final String imgurl;

  void selectScreen(BuildContext cxt) {
    Navigator.of(cxt).pushNamed(CategoryMeal.routName,
        arguments: {'id': id, 'title': title});
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        selectScreen(context);
        print("Categoryitemcklicked");
      },
      splashColor: color.withOpacity(1),
      borderRadius: BorderRadius.circular(30),
      child: Stack(
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Image.network(
                imgurl,
                fit: BoxFit.cover,
                width: 200,
                height: 200,
              )),
          Positioned(
            bottom: 20,
            right: 00,
            left: 00,
            child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                color: Colors.black54,
                child:
                    Text(title, style: Theme.of(context).textTheme.headline6)),
          )
        ],
      ),
      // child: Container(
      //   padding: EdgeInsets.all(30),

      //   child: Text(title, style: Theme.of(context).textTheme.headline6),
      //   decoration: BoxDecoration(
      //       gradient: LinearGradient(
      //         colors: [color, color.withOpacity(0.5)],
      //         begin: Alignment.bottomLeft,
      //         end: Alignment.topRight,

      //       ),
      //       borderRadius: BorderRadius.circular(30)),
      // ),
    );
  }
}
