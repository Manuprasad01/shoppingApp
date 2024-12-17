import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  final Map<String, String> item;

  const DetailPage({super.key, required this.item});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int count = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Image.asset(widget.item['image']!, height: 200),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Text(
                  widget.item['name']!,
                  style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                Spacer(),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        setState(() {
                          if (count > 1) count--;
                        });
                      },
                      icon: Icon(Icons.remove),
                      color: Colors.grey,
                    ),
                    Text(
                      '$count',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          count++;
                        });
                      },
                      icon: Icon(Icons.add),
                      color: Colors.grey,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Image.asset(
              widget.item["color"]!,
              height: 14,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "Drawing Room Wooden Sofa Set is solid wooden sofa set which you can contrast the cushion of any color.",
              style: TextStyle(color: Colors.grey[600]),
            ),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  widget.item['price']!,
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue),
                ),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromRGBO(121, 147, 174, 1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius
                            .zero, // This makes it rectangular (no rounded corners)
                      ),
                    ),
                    child: const Text("Add to cart",
                        style: TextStyle(
                            fontSize: 16,
                            color: Color.fromRGBO(255, 255, 255, 1)))),
              )
            ],
          ),
        ],
      ),
    );
  }
}
