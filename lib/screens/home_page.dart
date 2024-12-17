import 'package:flutter/material.dart';
import 'package:furniture_app/screens/detail_page.dart';
import 'package:furniture_app/theme/icolor.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int activeCategory = 0;
  List<bool> isFavoriteList = [false, false, false, false];

  final furnitureList = [
    {
      "name": "Room Sofa",
      "color": "assets/icons/coloricon.png",
      "price": "¥2500",
      "image": "assets/images/sofa.png",
    },
    {
      "name": "Toshiba TV",
      "color": "assets/icons/coloricon.png",
      "price": "¥35250",
      "image": "assets/images/tv.png",
    },
    {
      "name": "Table Lamp",
      "color": "assets/icons/coloricon.png",
      "price": "¥550",
      "image": "assets/images/lamp.png",
    },
    {
      "name": "Wood Table",
      "color": "assets/icons/coloricon.png",
      "price": "¥1200",
      "image": "assets/images/table.png",
    },
  ];

  final categories = [
    {"icon": "assets/icons/icon1.png"},
    {"icon": "assets/icons/icon2.png"},
    {"icon": "assets/icons/icon3.png"},
    {"icon": "assets/icons/icon4.png"},
    {"icon": "assets/icons/cart.png"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "Find the home\nfurniture",
          style: TextStyle(color: Colors.black, fontSize: 20),
        ),
        centerTitle: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.menu, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 80,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(categories.length, (index) {
                  final category = categories[index];
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        activeCategory = index;
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 10.0),
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: activeCategory == index ? clr : Colors.grey[100],
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade300,
                            blurRadius: 5,
                            spreadRadius: 2,
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(category["icon"]!,
                              height: 30,
                              width: 30,
                              color:
                                  activeCategory == index ? Colors.white : clr),
                          const SizedBox(height: 5),
                        ],
                      ),
                    ),
                  );
                }),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 50),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 10,
                  childAspectRatio: 0.7,
                ),
                itemCount: furnitureList.length,
                itemBuilder: (context, index) {
                  final furniture = furnitureList[index];
                  return _buildFurnitureCard(furniture, index);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFurnitureCard(Map<String, String> furniture, int index) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailPage(item: furniture),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned.fill(
              child: Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 70.0, left: 8, right: 8, bottom: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        furniture["name"]!,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                      Image.asset(
                        furniture["color"]!,
                        height: 14,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        furniture["price"]!,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: IconButton(
                          icon: Icon(Icons.add_circle, color: clr, size: 30),
                          onPressed: () {
                            // ignore: avoid_print
                            print("${furniture["name"]} added!");
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: 100,
              right: 4,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    isFavoriteList[index] = !isFavoriteList[index];
                  });
                },
                child: Icon(
                  Icons.favorite,
                  size: 28,
                  color: isFavoriteList[index] ? Colors.red : Colors.grey,
                ),
              ),
            ),
            Positioned(
              top: -40,
              left: 0,
              right: 0,
              child: SizedBox(
                height: 100,
                child: OverflowBox(
                  alignment: Alignment.topCenter,
                  maxHeight: 140,
                  child: Image.asset(
                    furniture["image"]!,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
