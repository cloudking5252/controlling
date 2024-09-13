import 'package:flutter/material.dart';
import 'package:somthing/procesdtoChacked.dart/shipping1.dart';

class Processedto extends StatefulWidget {
  final List<Map<String, dynamic>> favoriteProducts;

  Processedto({required this.favoriteProducts, Key? key}) : super(key: key);

  @override
  State<Processedto> createState() => _ProcessedtoState();
}

class _ProcessedtoState extends State<Processedto> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Checkout"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(5.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Shipping Address",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Container(
                height: 100,
                width: double.infinity,
                color: Colors.grey[200],
                alignment: Alignment.topLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.location_on, size: 24, color: Colors.brown),
                        SizedBox(width: 8),
                        Text(
                          "Home",
                          style: TextStyle(fontSize: 17),
                        ),
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Estimate Arrival 25 Aug 23 ",
                            style: TextStyle(fontSize: 13, color: Colors.grey),
                          ),
                          IconButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Shipping(),
                                ),
                              );
                            },
                            style: TextButton.styleFrom(
                              backgroundColor: Colors.white,
                              padding: EdgeInsets.all(10),
                            ),
                            icon: Text(
                              "CHANGE",
                              style: TextStyle(color: Colors.grey),
                            ),
                            color: Colors.grey,
                            padding: EdgeInsets.all(10),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Text(
                "Choose Shipping Type",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Container(
                height: 100,
                width: double.infinity,
                color: Colors.grey[200],
                alignment: Alignment.topLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.location_on, size: 24, color: Colors.brown),
                        SizedBox(width: 8),
                        Text(
                          "Economy",
                          style: TextStyle(fontSize: 17),
                        ),
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Estimate Arrival 25 Aug 23 ",
                            style: TextStyle(fontSize: 13, color: Colors.grey),
                          ),
                          IconButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Shipping(),
                                ),
                              );
                            },
                            style: TextButton.styleFrom(
                              backgroundColor: Colors.white,
                              padding: EdgeInsets.all(10),
                            ),
                            icon: Text(
                              "CHANGE",
                              style: TextStyle(color: Colors.grey),
                            ),
                            color: Colors.grey,
                            padding: EdgeInsets.all(10),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Text(
                "Favorite Products",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Container(
                height: 300,
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
                                    content:
                                        Text('${product['name']} deleted')),
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
                                    SizedBox(width: 10),
                                    Expanded(
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
                                            product['size'] ??
                                                'No Size Selected',
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.grey),
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
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
