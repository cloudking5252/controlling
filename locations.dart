import 'package:flutter/material.dart';

import 'package:somthing/Homepages.dart/homepage.dart';
import 'package:somthing/colors/customColors.dart';
import 'package:somthing/image/customimages.dart';

class Locations extends StatelessWidget {
  const Locations({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Center(
              child: Container(
                margin: EdgeInsets.only(top: 120),
                height: 120,
                width: 120,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: locationColors.locationimagecolor,
                  borderRadius: BorderRadius.circular(120),
                ),
                child: Center(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      image: DecorationImage(
                        image: AssetImage(
                            locationScreenimages.locationScreenimages1),
                        fit: BoxFit.cover,
                      ),
                    ),
                    height: 100,
                    width: 100,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Container(
              height: 100,
              child: const Column(
                children: [
                  Text(
                    "What Is Your Location?",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "We need to know your location in order to",
                    style: TextStyle(color: locationColors.Textcolor1),
                  ),
                  Text(
                    "suggest nearby services",
                    style: TextStyle(color: locationColors.Textcolor2),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Container(
              height: 60,
              width: 350,
              child: ElevatedButton(
                child: Text(
                  "Allow Location Access",
                  style:
                      TextStyle(fontSize: 16, color: locationColors.Textcolor3),
                ),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Confirmation'),
                        content: Text('Do you want to proceed?'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop(); // Close the dialog
                            },
                            child: Text('Deny'),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop(); // Close the dialog
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Homepage(),
                                ),
                              );
                            },
                            child: Text('Allow'),
                          ),
                        ],
                      );
                    },
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: locationColors.ElevatedButtonColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text('Enter Location Manually')
          ],
        ),
      ),
    );
  }
}
