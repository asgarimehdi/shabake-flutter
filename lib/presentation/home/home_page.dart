import 'package:flutter/material.dart';
import 'package:shabake/presentation/Opportuniies/opportunities_page.dart';
import 'package:shabake/presentation/auth/account_page.dart';
import 'package:shabake/presentation/favorites/favorites_page.dart';
import 'package:shabake/presentation/forum/questions_page.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController _pageController = PageController();
  final List<Widget> _screens = [
    OpportunitiesPage(),
    QuestionsPage(),
    FavoritesPage(),
    AccountPage()
  ];

  int _selectedIndex = 0;
  void _onPageChanged(int pageIndex) {
    setState(() {
      _selectedIndex = pageIndex;
    });
  }

  void _onItemTapped(int itemIndex) {
    setState(() {
      _pageController.jumpToPage(itemIndex);
      print(_selectedIndex);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: _screens,
        controller: _pageController,
        onPageChanged: _onPageChanged,
        physics: const NeverScrollableScrollPhysics(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: _onItemTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: 'Opportunities',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Forum',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Account',
          ),
        ],
        //backgroundColor: Colors.black, // <-- This works for fixed
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        currentIndex: _selectedIndex,
      ),
    );
  }
}
