// // ignore_for_file: prefer_const_constructors, use_build_context_synchronously

// import 'package:flutter/material.dart';
// import 'RegistrationScreen.dart';

// class SplashScreen extends StatefulWidget {
//   SplashScreen({super.key});

//   @override
//   State<SplashScreen> createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreen> {
// // Init State
//   @override
//   void initState() {
//     super.initState();
//     _navigatetohome();
//   }

//   _navigatetohome() async {
//     await Future.delayed(Duration(milliseconds: 1500), () {});
//     Navigator.pushReplacement(
//         context, MaterialPageRoute(builder: (context) => RegistrationScreen()));
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Container(
//               height: 100,
//               width: 100,
//               color: Colors.amberAccent,
//             ),
//             Container(
//               child: Text(
//                 'Splash Screen',
//                 style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
