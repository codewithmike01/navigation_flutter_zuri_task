// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, prefer_const_literals_to_create_immutables

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:navigation_task_hng/forget_password_screen.dart';
import 'package:navigation_task_hng/home_screen.dart';
import 'package:navigation_task_hng/registration_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final email = TextEditingController();
  final password = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('LOGIN SCREEN'),
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
              left: 10.0,
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
                    'LOGIN',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  Image.asset(
                    "assets/images/study.jpg",
                    height: size.height * 0.3,
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
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    width: size.width * 0.8,
                    decoration: BoxDecoration(
                        color: Colors.indigo[200],
                        borderRadius: BorderRadius.circular(20)),
                    child: TextField(
                      controller: password,
                      obscureText: true,
                      decoration: InputDecoration(
                        icon: Icon(
                          Icons.lock_clock_outlined,
                          color: Colors.indigo,
                        ),
                        suffixIcon:
                            Icon(Icons.visibility, color: Colors.indigo),
                        border: InputBorder.none,
                        hintText: "password",
                      ),
                    ),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        FirebaseAuth.instance
                            .signInWithEmailAndPassword(
                                email: email.text, password: password.text)
                            .then((value) => {
                                  Navigator.pushReplacement(context,
                                      MaterialPageRoute(builder: (context) {
                                    return HomeScreen();
                                  }))
                                });
                      },
                      style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(
                              vertical: 15, horizontal: 40)),
                      child: Text('LOGIN')),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Dont't have an account ?",
                        style: TextStyle(color: Colors.indigo),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return RegistrationScreen();
                          }));
                        },
                        child: Text(
                          " SignUp",
                          style: TextStyle(
                              color: Colors.indigo,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Text(
                        " or",
                        style: TextStyle(color: Colors.indigo),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return ForgetPasswordScreen();
                          }));
                        },
                        child: Text(
                          " forget password",
                          style: TextStyle(
                              color: Colors.indigo,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
