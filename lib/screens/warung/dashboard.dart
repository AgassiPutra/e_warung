import 'package:flutter/material.dart';
import 'package:e_warung/util/const.dart';
import 'package:shared_preferences/shared_preferences.dart';
//import screens
import 'package:e_warung/screens/warung/profil.dart';
import 'package:e_warung/screens/warung/katalog.dart';
import 'package:e_warung/screens/warung/notifikasi.dart';
import 'package:e_warung/screens/warung/list_produk_warung.dart';


class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: Constants.appName,
      home: const NavBar(),
    );
  }
}

class NavBar extends StatefulWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  late SharedPreferences sharedPreferences;
  int _selectedNavbar = 0;
  final List<Widget> _children = [
    ListWarungProduk(),
    Katalog(),
    Notifikasi(),
    ProfileScreen(),
  ];

  void changeSelectedNavBar(int index) {
    setState(() {
      _selectedNavbar = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_selectedNavbar],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: changeSelectedNavBar,
        currentIndex: _selectedNavbar,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.calculate),
            title: Text('Produk'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            title: Text('Katalog'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            title: Text('Notifikasi'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text('Profil'),
          ),
        ],
      ),
    );
  }
}
