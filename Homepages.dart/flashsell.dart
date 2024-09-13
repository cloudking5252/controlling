import 'package:flutter/material.dart';
import 'package:somthing/Homepages.dart/productdetail.dart';

class Flashsell extends StatefulWidget {
  const Flashsell({super.key});

  @override
  State<Flashsell> createState() => _FlashsellState();
}

class _FlashsellState extends State<Flashsell> {
  final List<Map<String, String>> items = [
    {
      'image': 'lib/image/images/shirts5.jpg',
      'name': 'Stylish Shirt',
      'price': '120.00'
    },
    {
      'image': 'lib/image/images/shirts7.jpg',
      'name': 'Casual Shirt',
      'price': '80.00'
    },
    {
      'image': 'lib/image/images/shirts8.jpg',
      'name': 'Formal Shirt',
      'price': '100.00'
    },
    {
      'image': 'lib/image/images/shirts9.jpg',
      'name': 'Party Shirt',
      'price': '150.00'
    },
  ];

  void _navigateToProductDetail(String image, String name, double price) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Productdetail(
          image: image,
          name: name,
          price: price,
          imagePath: null,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (int i = 0; i < items.length; i += 2)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              children: [
                for (int j = i; j < i + 2 && j < items.length; j++)
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 2.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: () {
                              final item = items[j];
                              _navigateToProductDetail(
                                item['image']!,
                                item['name']!,
                                double.parse(item['price']!),
                              );
                            },
                            child: Container(
                              height: 150,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                image: DecorationImage(
                                  image: AssetImage(items[j]['image']!),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(items[j]['name']!,
                              style: TextStyle(fontSize: 16)),
                          Text('Price: \$${items[j]['price']}',
                              style: TextStyle(fontSize: 14)),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
          ),
      ],
    );
  }
}
