import 'package:flutter/material.dart';
import 'package:somthing/procesdtoChacked.dart/processedto.dart';

List<Map<String, dynamic>> favoriteProducts = [];

class Productdetail extends StatefulWidget {
  final String image;
  final String name;
  final double price;
  final String? imagePath;

  const Productdetail({
    required this.image,
    required this.name,
    required this.price,
    this.imagePath,
    super.key,
  });

  @override
  _ProductdetailState createState() => _ProductdetailState();
}

class _ProductdetailState extends State<Productdetail> {
  int? _selectedSizeIndex;
  bool favorite = false;

  @override
  Widget build(BuildContext context) {
    final sizes = ['S', 'M', 'L', 'XL', 'XXL', 'XXXL'];

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    height: 250,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(
                        image: AssetImage(widget.image),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    right: 0,
                    child: IconButton(
                      onPressed: () {
                        setState(() {
                          favorite = !favorite;
                          if (favorite) {
                            favoriteProducts.add({
                              'image': widget.image,
                              'name': widget.name,
                              'price': widget.price,
                              'size': _selectedSizeIndex != null
                                  ? sizes[_selectedSizeIndex!]
                                  : null,
                            });
                          }
                        });
                      },
                      icon: Icon(
                        favorite ? Icons.favorite : Icons.favorite_border,
                        color: favorite ? Colors.red[200] : Colors.grey,
                        size: 50,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.name,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Price: \$${widget.price.toStringAsFixed(2)}',
                    style: TextStyle(fontSize: 12, color: Colors.grey[700]),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Text(
                "Product Detail",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              Text(
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
              ),
              Divider(thickness: 1, color: Colors.grey),
              Text(
                "Select Size",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              Container(
                height: 50,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: sizes.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedSizeIndex = index;
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.all(8.0),
                        width: 50,
                        decoration: BoxDecoration(
                          color: _selectedSizeIndex == index
                              ? Colors.red[200]
                              : Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: Colors.white,
                            width: 1,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            sizes[index],
                            style: TextStyle(
                              fontSize: 13,
                              color: _selectedSizeIndex == index
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              Container(
                height: 100,
                width: 360,
                child: Center(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              Processedto(favoriteProducts: favoriteProducts),
                        ),
                      );
                    },
                    child: Text("Add To Cart"),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.brown,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        fixedSize: Size(340, 50)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
