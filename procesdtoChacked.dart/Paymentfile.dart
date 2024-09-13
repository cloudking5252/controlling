import 'package:flutter/material.dart';
import 'package:somthing/procesdtoChacked.dart/addcard.dart';

import '../image/customimages.dart';

class Paymentfile extends StatefulWidget {
  const Paymentfile({super.key});

  @override
  _PaymentfileState createState() => _PaymentfileState();
}

class _PaymentfileState extends State<Paymentfile> {
  int? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Payment Method"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(top: 10, bottom: 10),
            child: const Text(
              "Credit & Debit Card",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(8),
            ),
            child: ListTile(
              tileColor: Colors.grey[200],
              title: Row(
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(paymentfile.paymentfile4),
                      ),
                    ),
                  ),
                  const SizedBox(width: 15),
                  const Text(
                    "Credit card",
                    style: TextStyle(),
                  ),
                ],
              ),
              trailing: Container(
                margin: const EdgeInsets.only(right: 8.0),
                padding: const EdgeInsets.all(4.0),
                child: const Icon(Icons.arrow_forward_ios),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10, bottom: 10),
            child: Text(
              "More Payment Options",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          ListTile(
            tileColor: Colors.grey[200],
            title: Row(
              children: [
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(paymentfile.paymentfile1),
                    ),
                  ),
                ),
                const SizedBox(width: 15),
                const Text("Paypal", style: TextStyle()),
              ],
            ),
            trailing: Radio(
              value: 1,
              groupValue: selectedValue,
              onChanged: (value) {
                setState(() {
                  selectedValue = value as int?;
                });
              },
            ),
          ),
          ListTile(
            tileColor: Colors.grey[200],
            title: Row(
              children: [
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(paymentfile.paymentfile3),
                    ),
                  ),
                ),
                const SizedBox(width: 15),
                const Text("Apple Pay", style: TextStyle()),
              ],
            ),
            trailing: Radio(
              value: 2,
              groupValue: selectedValue,
              onChanged: (value) {
                setState(() {
                  selectedValue = value as int?;
                });
              },
            ),
          ),
          ListTile(
            tileColor: Colors.grey[200],
            title: Row(
              children: [
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(paymentfile.paymentfile2),
                    ),
                  ),
                ),
                const SizedBox(width: 15),
                const Text("Google Pay", style: TextStyle()),
              ],
            ),
            trailing: Radio(
              value: 3,
              groupValue: selectedValue,
              onChanged: (value) {
                setState(() {
                  selectedValue = value as int?;
                });
              },
            ),
          ),
          const Spacer(),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (contaxt) => Addcard(),
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
    );
  }
}
