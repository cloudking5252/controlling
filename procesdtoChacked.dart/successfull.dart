import 'package:flutter/material.dart';

import 'dart.dart';

List yesicon = ["lib/image/images/yes1.jpg"];

class Successfull extends StatelessWidget {
  const Successfull({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("successfull"),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(top: 100),
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("lib/image/images/yes1.jpg"),
                        fit: BoxFit.cover),
                    borderRadius: BorderRadius.circular(100)),
                height: 120,
                width: 120,
              ),
            ],
          ),
          SizedBox(height: 10),
          Text(
            "Payment Successfull!",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Text(
            "Thanks For Your Puchased",
            style: TextStyle(color: Colors.grey),
          ),
          Spacer(),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (contaxt) => JacketSearchScreen(),
                    ),
                  );
                },
                child: const Text('View Order'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.brown,
                  foregroundColor: Colors.white,
                  shadowColor: Colors.black,
                  elevation: 5,
                  fixedSize: const Size(380, 50),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
