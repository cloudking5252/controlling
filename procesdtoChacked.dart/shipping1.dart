import 'package:flutter/material.dart';
import 'package:somthing/procesdtoChacked.dart/shipping2.dart';

class Shipping extends StatefulWidget {
  const Shipping({super.key});

  @override
  State<Shipping> createState() => _ShippingState();
}

class _ShippingState extends State<Shipping> {
  int? sselectedValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Shipping Options"),
      ),
      body: Column(
        children: [
          ListTile(
            tileColor: Colors.grey[200],
            title: Row(
              children: [
                Icon(Icons.location_on),
                SizedBox(width: 15),
                Text("Home", style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
            subtitle: Padding(
              padding: const EdgeInsets.only(left: 40),
              child: Text("Estimated arrival : 3-5 business days"),
            ),
            trailing: Radio<int>(
              value: 1,
              groupValue: sselectedValue,
              onChanged: (value) {
                setState(() {
                  sselectedValue = value;
                });
              },
            ),
          ),
          ListTile(
            tileColor: Colors.grey[200],
            title: Row(
              children: [
                Icon(Icons.location_on),
                SizedBox(width: 15),
                Text("Office", style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
            subtitle: Padding(
              padding: const EdgeInsets.only(left: 40),
              child: Text("Estimated arrival : 3-5 business days"),
            ),
            trailing: Radio<int>(
              value: 2,
              groupValue: sselectedValue,
              onChanged: (value) {
                setState(() {
                  sselectedValue = value;
                });
              },
            ),
          ),
          ListTile(
            tileColor: Colors.grey[200],
            title: Row(
              children: [
                Icon(Icons.location_on),
                SizedBox(width: 15),
                Text("Parents House",
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
            subtitle: Padding(
              padding: const EdgeInsets.only(left: 40),
              child: Text("Estimated arrival : 3-5 business days"),
            ),
            trailing: Radio<int>(
              value: 3,
              groupValue: sselectedValue,
              onChanged: (value) {
                setState(() {
                  sselectedValue = value;
                });
              },
            ),
          ),
          ListTile(
            tileColor: Colors.grey[200],
            title: Row(
              children: [
                Icon(Icons.location_on),
                SizedBox(width: 15),
                Text("Friend's House",
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
            subtitle: Padding(
              padding: const EdgeInsets.only(left: 40),
              child: Text("Estimated arrival : 3-5 business days"),
            ),
            trailing: Radio<int>(
              value: 4,
              groupValue: sselectedValue,
              onChanged: (value) {
                setState(() {
                  sselectedValue = value;
                });
              },
            ),
          ),
        ],
      ),
      bottomSheet: Container(
        padding: EdgeInsets.all(16),
        width: double.infinity,
        color: Colors.white,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.brown),
          onPressed: () {
            if (sselectedValue != null) {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Shipping2()),  
              );
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Shipping method selected!')),
              );
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Please select a shipping method.')),
              );
            }
          },
          child: Text(
            "Apply",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
