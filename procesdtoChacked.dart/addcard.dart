import 'package:flutter/material.dart';
import 'package:somthing/procesdtoChacked.dart/successfull.dart';

class Addcard extends StatefulWidget {
  const Addcard({super.key});

  @override
  State<Addcard> createState() => _AddcardState();
}

class _AddcardState extends State<Addcard> {
  bool isCardSaved = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Card"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  image: const DecorationImage(
                    image: AssetImage("lib/image/images/visacard3.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                child: const Text("Card Holder Name"),
              ),
              TextField(
                decoration: InputDecoration(
                  hintText: "Esther Howord",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                child: const Text("Card Number"),
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: "4487 02028 2032 744",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                child: Row(
                  children: const [
                    Text("Expiry Date"),
                    SizedBox(
                      width: 100,
                    ),
                    Text("CVV"),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 50,
                    width: 160,
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: "02/30",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 50,
                    width: 160,
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: "0000",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    isCardSaved = !isCardSaved;
                  });
                },
                child: Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 10, bottom: 10),
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                        color: isCardSaved ? Colors.green : Colors.grey,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: isCardSaved
                          ? const Icon(
                              Icons.check,
                              size: 17,
                              color: Colors.white,
                            )
                          : null,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text("Save Card")
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (contaxt) => Successfull(),
                        ),
                      );
                    },
                    child: const Text('Conform Payment'),
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
        ),
      ),
    );
  }
}
