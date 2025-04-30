import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomBottomNavBar extends StatefulWidget {
  @override
  _CustomBottomNavBarState createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  int _selectedIndex = 0;

  final List<String> iconPaths = [
    'assets/home.svg',
    'assets/search.svg',
    'assets/profile.svg',
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget _buildIcon(int index) {
    bool isSelected = _selectedIndex == index;
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isSelected ? Colors.white : Colors.transparent,
      ),
      child: SvgPicture.asset(
        iconPaths[index],
        color: isSelected ? Colors.yellow : Colors.grey,
        width: 24,
        height: 24,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("Tab $_selectedIndex")),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: List.generate(3, (index) {
          return BottomNavigationBarItem(
            icon: _buildIcon(index),
            label: '',
          );
        }),
        backgroundColor: Colors.black,
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 0,
        unselectedFontSize: 0,
        elevation: 10,
      ),
    );
  }
}
