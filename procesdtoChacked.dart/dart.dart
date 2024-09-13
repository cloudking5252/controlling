import 'package:flutter/material.dart';

Map<String, List<Map<String, String>>> jackets = {
  'shirt': [
    {'image': 'lib/image/images/shirts5.jpg', 'name': 'shirt', 'price': '\$50'},
    {'image': 'lib/image/images/shirts6.jpg', 'name': 'shirt', 'price': '\$55'},
    {'image': 'lib/image/images/shirts7.jpg', 'name': 'shirt', 'price': '\$60'},
    {'image': 'lib/image/images/shirts8.jpg', 'name': 'shirt', 'price': '\$65'},
  ],
  'pant': [
    {'image': 'lib/image/images/pant1.jpg', 'name': 'Pant', 'price': '\$30'},
    {'image': 'lib/image/images/pant2.jpg', 'name': 'Pant', 'price': '\$35'},
    {'image': 'lib/image/images/pant3.jpg', 'name': 'Pant', 'price': '\$40'},
    {'image': 'lib/image/images/pant4.jpg', 'name': 'Pant', 'price': '\$45'},
  ],
};

class JacketSearchScreen extends StatefulWidget {
  @override
  _JacketSearchScreenState createState() => _JacketSearchScreenState();
}

class _JacketSearchScreenState extends State<JacketSearchScreen> {
  String searchQuery = '';
  Map<String, bool> favorites = {};

  @override
  Widget build(BuildContext context) {
    final filteredItems = jackets.entries
        .where((entry) =>
            entry.key.toLowerCase().contains(searchQuery.toLowerCase()))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Search Jackets'),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.search),
                        labelText: 'Search for jackets',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(100),
                        ),
                      ),
                      onChanged: (query) {
                        setState(() {
                          searchQuery = query;
                        });
                      },
                    ),
                    SizedBox(height: 16),
                    Column(
                      children: filteredItems.map((item) {
                        final products = item.value;

                        return GridView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: products.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 10.0,
                            mainAxisSpacing: 10.0,
                          ),
                          itemBuilder: (context, imgIndex) {
                            final product = products[imgIndex];
                            final imagePath = product['image']!;
                            final productName = product['name']!;
                            final productPrice = product['price']!;
                            final isFavorite = favorites[imagePath] ?? false;

                            return Stack(
                              children: [
                                Column(
                                  children: [
                                    Expanded(
                                      child: Card(
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(15.0),
                                          child: Image.asset(
                                            imagePath,
                                            fit: BoxFit.cover,
                                            width: double.infinity,
                                            height: double.infinity,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                    Row(
                                      children: [
                                        Text(
                                          productName,
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          productPrice,
                                          style: TextStyle(
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Positioned(
                                  top: 0,
                                  right: 0,
                                  child: IconButton(
                                    icon: Icon(
                                      isFavorite
                                          ? Icons.favorite
                                          : Icons.favorite_border,
                                      color: isFavorite
                                          ? Colors.red[200]
                                          : Colors.yellow,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        favorites[imagePath] = !isFavorite;
                                      });
                                    },
                                  ),
                                ),
                              ],
                            );
                          },
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: () {},
                child: Text('Go to Another Screen'),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.brown,
                    foregroundColor: Colors.white,
                    shadowColor: Colors.black,
                    elevation: 5,
                    fixedSize: Size(380, 50)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
