import 'package:flutter/material.dart';

import './favorites_screen.dart';
import './categories_screen.dart';

import '../widgets/main_drawer.dart';

class TabsScreen extends StatefulWidget {
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {

  List<Map<String,Object>> _pages = [
    {
      'title': 'Categories',
      'page': CategoriesScreen(),
    },
    {
      'title': 'Favorites',
      'page': FavoritesScreen(),
    }
  ];

  int _selectedPageIndex = 0;

  void _selectPage(index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedPageIndex]['title']),
      ),
      drawer: MainDrawer(),
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        currentIndex: _selectedPageIndex,
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.category),
            backgroundColor: Theme.of(context).primaryColor,
            title: const Text('Categories'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            backgroundColor: Theme.of(context).primaryColor,
            title: const Text('Favorite'),
          )
        ],
      ),
    );
  }
}
