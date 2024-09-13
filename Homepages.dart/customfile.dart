import 'package:flutter/material.dart';

import '../image/customimages.dart';

List<Widget> generateContainers() {
  List<AssetImage> containerImages = [
    AssetImage(customfile.customfile1),
    AssetImage(customfile.customfile2),
    AssetImage(customfile.customfile3),
    AssetImage(customfile.customfile5),
  ];

  List<String> containerTexts = [
    'T.Shirt',
    'Dress',
    'Jacket',
    'Trousers',
  ];

  return List<Widget>.generate(4, (index) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(15),
            margin: EdgeInsets.all(10),
            height: 90,
            width: 90,
         
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(50),
            ),
            child: Padding(
              padding: EdgeInsets.all(8),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(17),
                child: Image(
                  image: containerImages[index],
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Text(
            containerTexts[index],
            style: TextStyle(fontSize: 14),
          ),
        ],
      ),
    );
  });
}
