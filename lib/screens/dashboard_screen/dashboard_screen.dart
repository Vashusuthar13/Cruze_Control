import 'package:cruze_control/screens/dashboard_screen/home_screen/home_screen.dart';
import 'package:cruze_control/screens/dashboard_screen/setting_screen/setting_screen.dart';
import 'package:cruze_control/screens/dashboard_screen/status_screen/status_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  Widget _buildIcon(String assetName, bool isSelected) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isSelected ? Colors.grey.withOpacity(0.2) : Colors.transparent,
      ),
      child: SvgPicture.asset(
        assetName,
        color: isSelected ? Colors.yellow : Colors.white,
        width: 24,
        height: 24,
      ),
    );
  }

  int _selectedIndex = 1; // Default to Home

  final List<Widget> _screens = [
    StatusScreen(),
    HomeScreen(),
    SettingsScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          splashFactory: NoSplash.splashFactory,
          highlightColor: Colors.transparent,
        ),
        child: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          backgroundColor: const Color(0xff2F2F2F),
          elevation: 4,
          selectedItemColor: Colors.yellow,
          unselectedItemColor: Colors.white,
          items: [
            BottomNavigationBarItem(
              icon: _buildIcon(
                  'assets/svg_icons/status.svg', _selectedIndex == 0),
              label: 'Status',
            ),
            BottomNavigationBarItem(
              icon:
                  _buildIcon('assets/svg_icons/home.svg', _selectedIndex == 1),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: _buildIcon(
                  'assets/svg_icons/setting.svg', _selectedIndex == 2),
              label: 'Setting',
            ),
          ],
        ),
      ),
    );
  }
}
