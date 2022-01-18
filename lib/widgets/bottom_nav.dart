import 'package:flutter/material.dart';
import 'package:flutter_banking_app/repo/repository.dart';
import 'package:flutter_banking_app/utils/iconly/iconly_bold.dart';
import 'package:flutter_banking_app/utils/styles.dart';
import 'package:flutter_banking_app/views/home.dart';
import 'package:flutter_banking_app/views/profile.dart';
import 'package:flutter_banking_app/views/stats.dart';
import 'package:flutter_banking_app/views/wallet.dart';

/// This is the stateful widget that the main application instantiates.
class BottomNav extends StatefulWidget {
  const BottomNav({Key? key}) : super(key: key);

  @override
  State<BottomNav> createState() => _BottomNavState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _BottomNavState extends State<BottomNav> {
  int _selectedIndex = 0;
  static final List<Widget> _widgetOptions = <Widget>[
    const Home(),
    const Wallet(),
    const Stats(),
    const Profile(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Repository.navbarColor(context),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedLabelStyle: TextStyle(fontSize: 20, color: Styles.primaryColor),
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Repository.selectedItemColor(context),
        unselectedItemColor: Colors.grey.withOpacity(0.7),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(IconlyBold.Home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(IconlyBold.Wallet),
            label: 'Wallet',
          ),
          BottomNavigationBarItem(
            icon: Icon(IconlyBold.Chart),
            label: 'Stats',
          ),
          BottomNavigationBarItem(
            icon: Icon(IconlyBold.Profile),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
