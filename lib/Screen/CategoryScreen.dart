import 'package:basic03/Widjet/CategoryItem.dart';
import 'package:basic03/dummy_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CategoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView(
        padding: EdgeInsets.all(10),
        children: DUMMY_CATEGORIES
            .map((e) => CategoryItem(e.id, e.title, e.color, e.imgurl))
            .toList(),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
          childAspectRatio: 3 / 2,
        ),
      ),
    );
  }
}
