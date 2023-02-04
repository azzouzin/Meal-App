import 'package:basic03/Models/Meal.dart';
import 'package:basic03/Widjet/MainDrwer.dart';
import 'package:flutter/material.dart';
import 'CategoryScreen.dart';
import 'favoriteScreen.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen(this.favorite, this.ismealfav, this.togglefav);
  static const routName = "SHIuuuu";
  final List<Meal> favorite;
  final Function ismealfav;
  final Function togglefav;

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  late List<Widget> _pages;

  final List<String> _titles = [
    " Category Screen",
    " Favorite Screen",
  ];

  @override
  void initState() {
    _pages = [
      CategoryScreen(),
      FavoriteScreen(widget.favorite, widget.togglefav, widget.ismealfav),
    ];
    super.initState();
  }

  var selectedpageindex = 0;

  void _selectpage(int value) {
    setState(() {
      selectedpageindex = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        _titles[selectedpageindex],
        style: TextStyle(fontFamily: "Realway", fontWeight: FontWeight.bold),
      )),
      body: _pages[selectedpageindex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectpage,
        backgroundColor: Theme.of(context).primaryColor,
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex: selectedpageindex,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.category), label: "Category"),
          BottomNavigationBarItem(
              icon: Icon(Icons.star_border), label: "Favorite"),
        ],
      ),
      drawer: MainDrawer(),
    );
  }
}
