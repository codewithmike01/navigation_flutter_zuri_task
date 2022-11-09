// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:navigation_task_hng/login_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: Text('Home Screen'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/happy.jpg",
                  height: size.height * 0.3,
                ),
                SizedBox(
                  height: size.height * 0.1,
                ),
                Text(
                  'Welcome to Home',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30.0,
                  ),
                ),
                SizedBox(
                  height: 15.0,
                ),
                Text(
                  '${FirebaseAuth.instance.currentUser!.email}',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30.0,
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                ElevatedButton(
                    onPressed: () {
                      FirebaseAuth.instance.signOut().then((value) => {
                            debugPrint('Signed out successfully'),
                            Navigator.pushReplacement(context,
                                MaterialPageRoute(builder: (context) {
                              return LoginScreen();
                            }))
                          });
                    },
                    style: ElevatedButton.styleFrom(
                        padding:
                            EdgeInsets.symmetric(vertical: 15, horizontal: 40)),
                    child: Text('Logout')),
              ],
            ),
          ),
        ));
  }
}
