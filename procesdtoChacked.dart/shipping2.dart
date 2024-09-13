import 'package:flutter/material.dart';
import 'package:somthing/image/customimages.dart';
import 'package:somthing/procesdtoChacked.dart/Paymentfile.dart';

// Ensure this import path is correct

class Shipping2 extends StatefulWidget {
  const Shipping2({super.key});

  @override
  State<Shipping2> createState() => _Shipping2State();
}

class _Shipping2State extends State<Shipping2> {
  int? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Shipping Options"),
      ),
      body: Column(
        children: [
          ListTile(
            tileColor: Colors.grey[200],
            title: Row(
              children: [
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                          shipping2.shipping3), // Ensure path is correct
                    ),
                  ),
                ),
                const SizedBox(width: 15),
                const Text("Economy",
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
            subtitle: const Padding(
              padding: EdgeInsets.only(left: 55),
              child: Text("Estimated arrival : 3-5 business days"),
            ),
            trailing: Radio<int>(
              value: 1,
              groupValue: selectedValue,
              onChanged: (value) {
                // Debug print
                setState(() {
                  selectedValue = value;
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
                      image: AssetImage(
                          shipping2.shipping4), // Ensure path is correct
                    ),
                  ),
                ),
                const SizedBox(width: 15),
                const Text("Regular",
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
            subtitle: const Padding(
              padding: EdgeInsets.only(left: 55),
              child: Text("Estimated arrival : 3-5 business days"),
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
                      image: AssetImage(
                          shipping2.shipping5), // Ensure path is correct
                    ),
                  ),
                ),
                const SizedBox(width: 15),
                const Text("Cargo",
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
            subtitle: const Padding(
              padding: EdgeInsets.only(left: 55),
              child: Text("Estimated arrival : 3-5 business days"),
            ),
            trailing: Radio<int>(
              value: 3,
              groupValue: selectedValue,
              onChanged: (value) {
                print('Cargo Radio Clicked: $value'); // Debug print
                setState(() {
                  selectedValue = value;
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
                      image: AssetImage(shipping2.shipping6),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(width: 15),
                const Text("Friend's House",
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
            subtitle: const Padding(
              padding: EdgeInsets.only(left: 55),
              child: Text("Estimated arrival : 3-5 business days"),
            ),
            trailing: Radio<int>(
              value: 4,
              groupValue: selectedValue,
              onChanged: (value) {
                print('Friend\'s House Radio Clicked: $value');
                setState(() {
                  selectedValue = value;
                });
              },
            ),
          ),
        ],
      ),
      bottomSheet: Container(
        padding: const EdgeInsets.all(16),
        width: double.infinity,
        color: Colors.white,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.brown),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (contaxt) => Paymentfile(),
              ),
            );
            if (selectedValue != null) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Shipping method selected!')),
              );
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                    content: Text('Please select a shipping method.')),
              );
            }
          },
          child: const Text(
            "Continue",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
