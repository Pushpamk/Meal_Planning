import 'dart:ui';

import 'package:flutter/material.dart';

import './screens/filters_screen.dart';
import './screens/meal_detail_screen.dart';
import './screens/tabs_screen.dart';
import './screens/categories_meal_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Daily Meals',
      theme: ThemeData(
          primarySwatch: Colors.cyan,
          accentColor: Colors.black12,
          canvasColor: Color.fromRGBO(254, 230, 229, 1),
          fontFamily: 'Raleway',
          textTheme: ThemeData.light().textTheme.copyWith(
              body1: TextStyle(color: Color.fromRGBO(20, 29, 29, 1)),
              body2: TextStyle(
                color: Color.fromRGBO(20, 29, 29, 1),
              ),
              title: TextStyle(
                fontSize: 22,
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold,
              ))),
      home: TabsScreen(),
      routes: {
        CategoriesMealScreen.routeName: (_) => CategoriesMealScreen(),
        MealDetailScreen.routeName: (_) => MealDetailScreen(),
        FiltersScreen.routeName: (_) => FiltersScreen()
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (_) => CategoriesMealScreen());
      },
    );
  }
}
