import 'package:basic03/Screen/CategoryScreen.dart';
import 'package:basic03/Screen/Filters_Screen.dart';
import 'package:basic03/Screen/TabsScreen.dart';
import 'package:flutter/material.dart';

class MainDrawer extends StatefulWidget {
  @override
  _MainDrawerState createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {
  Widget listTileB(
    String title,
    IconData iconData,
  ) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.all(20),
      child: Row(
        children: [
          Icon(iconData),
          SizedBox(
            width: 10,
          ),
          Text(
            title,
            style: TextStyle(color: Colors.black),
          ),
        ],
      ),
      width: double.infinity,
    );
  }

  void navigat() {
    print("ListClicked");

    Navigator.of(context).pushReplacementNamed(Filters_Screen.routName);
  }

  void navigat1() {
    print("ListClicked");

    Navigator.of(context).pushReplacementNamed(TabsScreen.routName);
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          InkWell(
            onTap: () {
              print("Containeer cklickeeed");
            },
            child: Container(
              height: 120,
              width: double.infinity,
              alignment: Alignment.center,
              color: Theme.of(context).primaryColor,
              padding: EdgeInsets.all(20),
              child: Text(
                "Cooking Up ! ",
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
          ),
          InkWell(
            child: listTileB("Filters", Icons.filter),
            onTap: navigat,
          ),
          InkWell(
            child: listTileB("Meal", Icons.restaurant_menu),
            onTap: navigat1,
          ),
        ],
      ),
    );
  }
}
