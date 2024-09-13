import 'package:flutter/material.dart';

class ElevatedButtonsRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(children: [
        Padding(
          padding: EdgeInsets.only(right: 10),
          child: ElevatedButton(
            onPressed: () {},
            child: Text("All"),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              side: BorderSide(color: Colors.black),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(right: 10),
          child: ElevatedButton(
            onPressed: () {},
            child: Text("Newest"),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              side: BorderSide(color: Colors.black),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(right: 10),
          child: ElevatedButton(
            onPressed: () {},
            child: Text("Popular"),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              side: BorderSide(color: Colors.black),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(right: 10),
          child: ElevatedButton(
            onPressed: () {},
            child: Text("Man"),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              side: BorderSide(color: Colors.black),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(right: 10),
          child: ElevatedButton(
            onPressed: () {},
            child: Text("Work"),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              side: BorderSide(color: Colors.black),
            ),
          ),
        ),
      ]),
    );
  }
}
