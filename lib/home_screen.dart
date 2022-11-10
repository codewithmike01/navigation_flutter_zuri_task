// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:navigation_task_hng/login_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final player = TextEditingController();
  final update = TextEditingController();

  final firestore = FirebaseFirestore.instance;

  late Stream<QuerySnapshot> streamUser;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    streamUser = firestore.collection('users').snapshots();
  }

  void _clearField() {
    player.clear();
    update.clear();
  }

  void _create(playerName) async {
    try {
      await firestore
          .collection('users')
          .doc('testUser')
          .set({'playerName': playerName});
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void _update(data) async {
    try {
      firestore.collection('users').doc('testUser').set({'playerName': data});
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void _delete() async {
    try {
      firestore.collection('users').doc('testUser').delete();
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    player.dispose();
    // playerUpdate.dispose();
    super.dispose();
  }

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
                Text(
                  'Enter Player name',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30.0,
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  width: size.width * 0.8,
                  decoration: BoxDecoration(
                      color: Colors.indigo[200],
                      borderRadius: BorderRadius.circular(20)),
                  child: TextField(
                    controller: player,
                    decoration: InputDecoration(
                      icon: Icon(
                        Icons.lock_clock_outlined,
                        color: Colors.indigo,
                      ),
                      border: InputBorder.none,
                      hintText: "player name",
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    _create(player.text);
                    _clearField();
                  },
                  style: ElevatedButton.styleFrom(
                      padding:
                          EdgeInsets.symmetric(vertical: 15, horizontal: 40)),
                  child: Text('Create Player'),
                ),
                SizedBox(height: 20.0),
                StreamBuilder<QuerySnapshot>(
                  stream: streamUser,
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    var items = [];

                    if (snapshot.hasError) {
                      return Text('No player added');
                    }

                    if (snapshot.hasData) {
                      //get the data
                      QuerySnapshot querySnapshot = snapshot.data;
                      List<QueryDocumentSnapshot> documents =
                          querySnapshot.docs;

                      //Convert the documents to Maps
                      items = documents
                          .map((e) => {'playerName': e['playerName']})
                          .toList();
                    }

                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'PLayer Name: ',
                          style: TextStyle(
                              fontSize: 25.0, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          items.isNotEmpty
                              ? items[0]['playerName'].toString()
                              : "No Player added",
                          style: TextStyle(
                              fontSize: 25.0, fontWeight: FontWeight.bold),
                        ),
                      ],
                    );
                  },
                ),
                SizedBox(height: 20.0),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  width: size.width * 0.8,
                  decoration: BoxDecoration(
                      color: Colors.indigo[200],
                      borderRadius: BorderRadius.circular(20)),
                  child: TextField(
                    controller: update,
                    decoration: InputDecoration(
                      icon: Icon(
                        Icons.lock_clock_outlined,
                        color: Colors.indigo,
                      ),
                      border: InputBorder.none,
                      hintText: "Update name",
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    _update(update.text);
                    _clearField();
                  },
                  style: ElevatedButton.styleFrom(
                      padding:
                          EdgeInsets.symmetric(vertical: 15, horizontal: 40)),
                  child: Text('Update Player'),
                ),
                SizedBox(height: 20.0),
                ElevatedButton(
                  onPressed: () {
                    _delete();
                  },
                  style: ElevatedButton.styleFrom(
                      padding:
                          EdgeInsets.symmetric(vertical: 15, horizontal: 40)),
                  child: Text('Delete PLayer'),
                ),
                SizedBox(height: 20.0),
                ElevatedButton(
                    onPressed: () async {
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
                SizedBox(
                  height: 20.0,
                ),
              ],
            ),
          ),
        ));
  }
}
