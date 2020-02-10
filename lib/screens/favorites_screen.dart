import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class FavoritesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text(
        'Favorites Screen'
      ),
      drawer: MainDrawer(),
    );
  }
}
