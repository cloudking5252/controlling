import 'package:flutter/material.dart';
import 'package:somthing/colors/customColors.dart';

import 'locations.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 100,
            width: 360,
            margin: EdgeInsets.only(top: 70),
            child: Center(
              child: Column(
                children: [
                  Text(
                    "Sign In",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Hi! Welcome Back, You've been missed",
                    style: TextStyle(
                      color: signin.Textcolor1,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 1,
              itemBuilder: (context, index) {
                return Container(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Email",
                        style:
                            TextStyle(color: signin.Textcolor2, fontSize: 16),
                      ),
                      TextField(
                        decoration: InputDecoration(
                          hintText: "Enter your email",
                          filled: true,
                          fillColor: signin.TextFieldcolor1,
                          suffixIcon: Icon(Icons.email),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                              50,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        "Password",
                        style:
                            TextStyle(color: signin.Textcolor3, fontSize: 16),
                      ),

                      TextField(
                        obscureText: obscureText,
                        decoration: InputDecoration(
                          hintText: "Enter your password",
                          filled: true,
                          fillColor: signin.TextFieldcolor1,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(
                              obscureText
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: signin.suffixIconcolor,
                            ),
                            onPressed: () {
                              setState(() {
                                obscureText = !obscureText;
                              });
                            },
                          ),
                        ),
                      ),

                      SizedBox(
                          height: 50), // Space between TextField and Button
                      Container(
                        height: 60,
                        width: 350,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (contaxt) => Locations(),
                              ),
                            );
                            // Add your sign in logic here
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: signin.Buttoncolor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                            // Padding
                          ),
                          child: Text(
                            "Sign In",
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Center(
                        child: Column(
                          children: [
                            Padding(padding: EdgeInsets.only(top: 10)),
                            Text(
                              "Forgote Password",
                              style: TextStyle(
                                decoration: TextDecoration
                                    .underline, // Yahan underline set ho rahi hai
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
