import 'dart:async';
import 'package:flutter/material.dart';
import 'package:somthing/Homepages.dart/flashsell.dart';
import 'textwidgetfile.dart';

import '../image/customimages.dart';
import 'buttonfile.dart';
import 'customfile.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage>
    with SingleTickerProviderStateMixin {
  int _currentImageIndex = 0;
  late Timer _timer;

  List<String> imageList = [
    homepageimages.homepageimages1,
    homepageimages.homepageimages2,
    homepageimages.homepageimages3,
    
  ];

  @override
  void initState() {
    super.initState();

    _timer = Timer.periodic(Duration(seconds: 5), (Timer timer) {
      setState(() {
        _currentImageIndex = (_currentImageIndex + 1) % imageList.length;
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(5),
            child: Column(
              children: [
                Padding(padding: EdgeInsets.only(top: 20)),
                TextField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    labelText: "Search",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 20)),
                Stack(
                  children: [
                    Container(
                      margin: EdgeInsets.all(0),
                      height: 180,
                      width: double.infinity,
                      child: AnimatedSwitcher(
                        duration:
                            Duration(milliseconds: 1000), // Animation speed
                        transitionBuilder:
                            (Widget child, Animation<double> animation) {
                          final slideAnimation = Tween<Offset>(
                            begin: Offset(1.0, 0.0),
                            end: Offset(0.0, 0.0),
                          ).animate(animation);

                          return SlideTransition(
                            position: slideAnimation,
                            child: child,
                          );
                        },
                        child: Container(
                          key: ValueKey<int>(_currentImageIndex),
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(imageList[_currentImageIndex]),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 20,
                      left: 20,
                      child: TextWidgetFile(),
                    ),
                  ],
                ),
                Padding(padding: EdgeInsets.only(top: 20)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Category",
                      style: TextStyle(fontSize: 18),
                    ),
                    Text("See all"),
                  ],
                ),
                Container(
                  height: 180,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: generateContainers(),
                  ),
                ),
                Container(
                  width: double.infinity,
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(0),
                        child: Text(
                          'Flash Sell',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                      SizedBox(height: 5),
                      ElevatedButtonsRow(),
                      Flashsell(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
