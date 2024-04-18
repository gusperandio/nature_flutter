import 'package:flutter/material.dart';
import 'package:natureatoz/pages/home_screen.dart';
import 'package:natureatoz/pages/search_screen.dart';
import 'package:natureatoz/pages/like_screen.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    return const HomeScreen();
  }
}

class Page2 extends StatelessWidget {
  const Page2({super.key});

  @override
  Widget build(BuildContext context) {
    return SearchScreen();
  }
}

class Page3 extends StatelessWidget {
  const Page3({super.key});

  @override
  Widget build(BuildContext context) {
    return LikeScreen();
  }
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    Page1(),
    Page2(),
    Page3(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget _buildBarItem(IconData icon, int index) {
    return GestureDetector(
      onTap: () {
        _onItemTapped(index);
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            children: [
              if (_selectedIndex == index)
                Positioned(
                  bottom: 0,
                  left: 0,
                  child: Container(
                    width: 10,
                    height: 10,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFFf28705),
                    ),
                  ),
                ),
              Icon(
                size: 32,
                icon,
                color: _selectedIndex == index
                    ? const Color(0xFF222222)
                    : Colors.grey,
              ),
            ],
          ),
          const SizedBox(height: 4),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: 
      _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: SizedBox(
        height: 70,
        child: BottomAppBar(
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            _buildBarItem(Icons.home, 0),
            _buildBarItem(Icons.search, 1),
            _buildBarItem(Icons.favorite, 2),
          ],
        ),
      )),
    );
  }
}
