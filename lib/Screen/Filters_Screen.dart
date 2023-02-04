import 'dart:ffi';

import 'package:basic03/Widjet/MainDrwer.dart';
import 'package:flutter/material.dart';

class Filters_Screen extends StatefulWidget {
  static const String routName = "Filters_Screen";
  final Function savf;
  final Map<String, bool> filters;
  const Filters_Screen(this.filters, this.savf);

  @override
  _Filters_ScreenState createState() => _Filters_ScreenState();
}

class _Filters_ScreenState extends State<Filters_Screen> {
  var _isglutFree = true;
  var _isLactostFree = true;
  var _isvegan = true;
  var _isvegetarien = true;
  @override
  void initState() {
    _isglutFree = widget.filters['glutfree'] as bool;
    _isLactostFree = widget.filters['lactosfree'] as bool;
    _isvegan = widget.filters['isvegan'] as bool;
    _isvegetarien = widget.filters['isvegetarian'] as bool;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                final Map<String, bool> selectedf = {
                  'glutfree': _isglutFree,
                  'lactosfree': _isLactostFree,
                  'isvegan': _isvegan,
                  'isvegetarian': _isvegetarien,
                };
                widget.savf(
                  selectedf,
                );
              },
              icon: Icon(Icons.save))
        ],
        title: Text(
          ('Your Filters'),
        ),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 20, bottom: 10),
            alignment: Alignment.center,
            child: Text(
              "Filter Your Meals",
              style: Theme.of(context).textTheme.headline6,
            ),
            width: double.infinity,
          ),
          Expanded(
            child: ListView(
              children: [
                SwitchListTile(
                  title: Text("Gluten - Free"),
                  subtitle: Text("This is Show You Onely Gluten Free Meals"),
                  onChanged: (newValu) {
                    setState(() {
                      _isglutFree = newValu;
                    });
                  },
                  value: _isglutFree,
                ),
                SwitchListTile(
                  title: Text("Vegan"),
                  subtitle: Text("This is Show You Onely Vegan Meals"),
                  onChanged: (newValu) {
                    setState(() {
                      _isvegan = newValu;
                    });
                  },
                  value: _isvegan,
                ),
                SwitchListTile(
                  title: Text("Lactos -Free"),
                  subtitle: Text("This is Show You Onely Lactos -Free Meals"),
                  onChanged: (newValu) {
                    setState(() {
                      _isLactostFree = newValu;
                    });
                  },
                  value: _isLactostFree,
                ),
                SwitchListTile(
                  title: Text("Vegetarian"),
                  subtitle: Text("This is Show You Onely Vegetarian Meals"),
                  onChanged: (newValu) {
                    setState(() {
                      _isvegetarien = newValu;
                    });
                  },
                  value: _isvegetarien,
                ),
              ],
            ),
          )
        ],
      ),
      drawer: MainDrawer(),
    );
  }
}
