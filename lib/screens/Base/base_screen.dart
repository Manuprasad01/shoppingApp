import 'package:flutter/material.dart';

import '../../widgets/custom_bot_nav.dart';
import '../account.dart';
import '../carts.dart';
import '../favourites.dart';
import '../home_page.dart';
import '../scan.dart';

class BaseScreen extends StatefulWidget {
  const BaseScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _BaseScreenState createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  int _currentIndex = 0;

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  final List<Widget> _pages = [
    const HomePage(),
    const FavoritePage(),
    const ScanPage(),
    const CartPage(),
    const AccountPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar:
          CustomBottomNavBar(currentIndex: _currentIndex, onTap: _onTabTapped),
    );
  }
}
