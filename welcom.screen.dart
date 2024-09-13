import 'package:flutter/material.dart';
import 'package:somthing/colors/customColors.dart';
import 'package:somthing/image/customimages.dart';

import 'signIn.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: 190,
                  height: 400,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    image: DecorationImage(
                        image: AssetImage(
                            WelcomeScreenimages.WelcomeScreenimages1),
                        fit: BoxFit.cover),
                  ),
                ),
                Container(
                  width: 170,
                  child: Column(
                    children: <Widget>[
                      Container(
                        height: 230,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          image: DecorationImage(
                              image: AssetImage(
                                  WelcomeScreenimages.WelcomeScreenimages2),
                              fit: BoxFit.cover),
                        ),
                        width: double.infinity,
                      ),
                      Container(
                        width: double.infinity,
                        height: 170,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          image: DecorationImage(
                              image: AssetImage(
                                  WelcomeScreenimages.WelcomeScreenimages3),
                              fit: BoxFit.cover),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              height: 100,
              width: 370,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  RichText(
                    text: TextSpan(
                      text: 'The Fashion App That',
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: WelcomeScreendart.TextColor),
                    ),
                  ),
                  Text(
                    'Makes You Look Your Bes',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(bottom: 30, top: 30),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (contaxt) => Login(),
                    ),
                  );
                },
                child: Text('Lets Get Started'),
                style: ElevatedButton.styleFrom(
                    backgroundColor: WelcomeScreendart.Button,
                    foregroundColor: WelcomeScreendart.TextButton,
                    shadowColor: Colors.black,
                    elevation: 5,
                    fixedSize: Size(370, 60)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
