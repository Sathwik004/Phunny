import 'package:flutter/material.dart';
import 'package:jokes_app/pages/HomePage/home_screen.dart';
import 'package:jokes_app/pages/SavedJokesPage/saved_jokes_screen.dart';

class MyBottomNavBar extends StatelessWidget{

  const MyBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(items: <BottomNavigationBarItem>[
      BottomNavigationBarItem(
        icon: IconButton(onPressed: () => Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const MyHomePage(),)), icon: const Icon(Icons.home)),
        label: 'Home',
      ),
      BottomNavigationBarItem(
        icon: IconButton(onPressed: () => Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const SavedJokesScreen(),)), icon:const Icon(Icons.favorite)),
        label: 'Saved',
      ),
    ],
    );
  }

}