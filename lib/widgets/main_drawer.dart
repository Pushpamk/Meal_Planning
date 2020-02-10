import 'package:flutter/material.dart';

import '../screens/filters_screen.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            child: Text(
              'Meal Application',
              style: TextStyle(color: Colors.black12, fontSize: 35),
            ),
            alignment: Alignment.center,
            padding: EdgeInsets.all(5),
            height: 250,
            width: double.infinity,
            color: Theme.of(context).primaryColor,
          ),
          SizedBox(),
          ListTile(
            leading: Icon(
              Icons.settings,
              size: 20,
            ),
            title: const Text('Filter'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(FiltersScreen.routeName);
            },
          ),
          ListTile(
              leading: Icon(
                Icons.category,
                size: 20,
              ),
              title: const Text('Categories'),
              onTap: () {
                Navigator.of(context).pushReplacementNamed(
                  '/',
                );
              })
        ],
      ),
    );
  }
}
