// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'login_screen.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final email = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    email.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome'),
        centerTitle: true,
      ),
      body: Container(
        height: size.height,
        width: double.infinity,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              top: 0,
              left: -10.0,
              child: Image.asset(
                'assets/images/coach.jpg',
                width: size.width * 0.3,
              ),
            ),
            Positioned(
              bottom: 0,
              right: -10.0,
              child: Image.asset(
                'assets/images/coach.jpg',
                width: size.width * 0.3,
              ),
            ),
            SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Forget Password',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Image.asset(
                    "assets/images/study.jpg",
                    height: size.height * 0.4,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    width: size.width * 0.8,
                    decoration: BoxDecoration(
                        color: Colors.indigo[200],
                        borderRadius: BorderRadius.circular(20)),
                    child: TextField(
                      controller: email,
                      decoration: InputDecoration(
                          icon: Icon(
                            Icons.person_add_alt,
                            color: Colors.indigo,
                          ),
                          border: InputBorder.none,
                          hintText: "yourname@mail.com"),
                    ),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        FirebaseAuth.instance
                            .sendPasswordResetEmail(email: email.text)
                            .then((value) => {
                                  if (email.text != '')
                                    {
                                      Navigator.pushReplacement(context,
                                          MaterialPageRoute(builder: (context) {
                                        return LoginScreen();
                                      }))
                                    }
                                });
                      },
                      style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(
                              vertical: 15, horizontal: 40)),
                      child: Text('SEND')),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
