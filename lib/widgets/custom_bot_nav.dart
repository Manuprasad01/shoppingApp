import 'package:flutter/material.dart';
import 'package:furniture_app/theme/icolor.dart';

class CustomBottomNavBar extends StatefulWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          decoration: const BoxDecoration(
            color: Color.fromRGBO(255, 255, 255, 1),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24.0),
              topRight: Radius.circular(24.0),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 10,
                spreadRadius: 2,
                offset: Offset(0, -2),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(24.0),
              topRight: Radius.circular(24.0),
            ),
            child: BottomNavigationBar(
              currentIndex: widget.currentIndex,
              onTap: widget.onTap,
              backgroundColor: Colors.white,
              selectedItemColor: Colors.blue,
              unselectedItemColor: Colors.grey,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              type: BottomNavigationBarType.fixed,
              items: [
                _buildNavItem('Home', 'assets/icons/home.png', 0),
                _buildNavItem('Favorites', 'assets/icons/heart.png', 1),
                _buildNavItem('Scan', 'assets/icons/scan.png', 2),
                _buildNavItem('Cart', 'assets/icons/cart.png', 3),
                _buildNavItem('Account', 'assets/icons/account.png', 4),
              ],
            ),
          ),
        ),
        Positioned(
          top: -25,
          left: _calculateIconPosition(widget.currentIndex),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeOut,
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              color: clr,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 10,
                  spreadRadius: 2,
                )
              ],
            ),
            child: Center(
              child: Image.asset(
                _getIcon(widget.currentIndex),
                height: 35,
                color: const Color.fromARGB(255, 255, 255, 255),
              ),
            ),
          ),
        ),
      ],
    );
  }

  BottomNavigationBarItem _buildNavItem(
      String label, String iconPath, int index) {
    return BottomNavigationBarItem(
        icon: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
          height: 26,
          child: Opacity(
            opacity: widget.currentIndex == index ? 0 : 1,
            child: Image.asset(iconPath, color: Colors.grey),
          ),
        ),
        label: label);
  }

  double _calculateIconPosition(int index) {
    double screenWidth = MediaQuery.of(context).size.width;
    return screenWidth / 5 * index + (screenWidth / 10 - 30);
  }

  String _getIcon(int index) {
    switch (index) {
      case 0:
        return 'assets/icons/home.png';
      case 1:
        return 'assets/icons/heart.png';
      case 2:
        return 'assets/icons/scan.png';
      case 3:
        return 'assets/icons/cart.png';
      case 4:
        return 'assets/icons/account.png';
      default:
        return '';
    }
  }
}
