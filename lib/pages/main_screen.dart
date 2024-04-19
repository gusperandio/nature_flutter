import 'package:flutter/material.dart';
import 'package:natureatoz/pages/home_screen.dart';
import 'package:natureatoz/pages/search_screen.dart';
import 'package:natureatoz/pages/like_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    return HomeScreen();
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
    const Page1(),
    const Page2(),
    const Page3(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget _buildBarItem(String activeIcon, String inactiveIcon, int index, double size) {


    return GestureDetector(
      onTap: () {
        _onItemTapped(index);
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            children: [
              SvgPicture.asset(
                _selectedIndex == index ? activeIcon : inactiveIcon,
                height: size,
                width: size,
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: SizedBox(
          height: 80,
          child: BottomAppBar(
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                _buildBarItem(
                  'assets/svg/home_active.svg',
                  'assets/svg/home.svg',
                  0,
                  28
                ),
                _buildBarItem(
                  'assets/svg/search_active.svg',
                  'assets/svg/search.svg',
                  1,
                  52
                ),
                _buildBarItem(
                  'assets/svg/like_active.svg',
                  'assets/svg/like.svg',
                  2,
                  24
                ),
              ],
            ),
          )),
    );
  }
}
