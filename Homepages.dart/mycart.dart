import 'package:flutter/material.dart';

import 'package:somthing/procesdtoChacked.dart/processedto.dart';

class FavoriteScreen extends StatefulWidget {
  final List<Map<String, dynamic>> favoriteProducts;

  const FavoriteScreen({required this.favoriteProducts});

  @override
  _FavoriteScreenState createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
           
          Expanded(
            child: widget.favoriteProducts.isEmpty
                ? Center(
                    child: Text(
                      'No favorite products',
                      style: TextStyle(fontSize: 20),
                    ),
                  )
                : ListView.builder(
                    itemCount: widget.favoriteProducts.length,
                    itemBuilder: (context, index) {
                      final product = widget.favoriteProducts[index];

                      return Dismissible(
                        key: Key(product['name']),
                        direction: DismissDirection.endToStart,
                        background: Container(
                          alignment: Alignment.centerRight,
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Icon(
                            Icons.delete,
                            color: Colors.black,
                            size: 30,
                          ),
                        ),
                        onDismissed: (direction) {
                          setState(() {
                            widget.favoriteProducts.removeAt(index);
                          });

                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                                content: Text('${product['name']} deleted')),
                          );
                        },
                        child: Container(
                          color: Colors.grey[300],
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 5.0, horizontal: 8),
                            child: Row(
                              children: [
                                Container(
                                  width: 120,
                                  height: 120,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    image: DecorationImage(
                                      image: AssetImage(product['image']),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: Container(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          product['name'],
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          'Price: \$${product['price']}',
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.grey[700]),
                                        ),
                                        Text(
                                          product['size'] ?? 'No Size Selected',
                                          style: TextStyle(
                                              fontSize: 14, color: Colors.grey),
                                        ),
                                        SizedBox(height: 10),
                                        Row(
                                          children: [
                                            IconButton(
                                              icon: Icon(Icons.remove),
                                              onPressed: () {
                                                setState(() {
                                                  product['quantity'] =
                                                      (product['quantity'] ??
                                                              1) -
                                                          1;
                                                  if (product['quantity'] <=
                                                      0) {
                                                    widget.favoriteProducts
                                                        .removeAt(index);
                                                  }
                                                });
                                              },
                                            ),
                                            Text(
                                              'Qty: ${product['quantity'] ?? 1}',
                                              style: TextStyle(fontSize: 16),
                                            ),
                                            IconButton(
                                              icon: Icon(Icons.add),
                                              onPressed: () {
                                                setState(() {
                                                  product['quantity'] =
                                                      (product['quantity'] ??
                                                              1) +
                                                          1;
                                                });
                                              },
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
          ),

          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (contaxt) => Processedto(favoriteProducts: [],),
                  ),
                );
              },
              child: Text(
                'Proceed to Checkout',
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.brown,
                foregroundColor: Colors.white,
                minimumSize: Size(double.infinity, 50),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
