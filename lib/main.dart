import 'package:flutter/material.dart';
import 'package:furniture_app/screens/landing/landing_page.dart';

import 'theme/icolor.dart';

void main() {
  runApp(const FurnitureApp());
}

class FurnitureApp extends StatelessWidget {
  const FurnitureApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Furniture App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        iconTheme: IconThemeData(
          color: clr,
          size: 24.0,
        ),
        fontFamily: 'Hauora',
      ),
      home: const LandingPage(),
    );
  }
}
