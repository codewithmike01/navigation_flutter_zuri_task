// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace
import 'package:flutter/material.dart';
import 'package:navigation_task_hng/home_screen.dart';
import 'package:navigation_task_hng/login_screen.dart';

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Registration Screen'),
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
                    'SignUp',
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
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    width: size.width * 0.8,
                    decoration: BoxDecoration(
                        color: Colors.indigo[200],
                        borderRadius: BorderRadius.circular(20)),
                    child: TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        icon: Icon(
                          Icons.lock_clock_outlined,
                          color: Colors.indigo,
                        ),
                        suffixIcon:
                            Icon(Icons.visibility, color: Colors.indigo),
                        border: InputBorder.none,
                        hintText: "Confirm password",
                      ),
                    ),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) {
                          return HomeScreen();
                        }));
                      },
                      style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(
                              vertical: 15, horizontal: 40)),
                      child: Text('SignUp')),
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
                              return LoginScreen();
                            }));
                          },
                          child: Text(
                            " Login",
                            style: TextStyle(
                                color: Colors.indigo,
                                fontWeight: FontWeight.bold),
                          ))
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
