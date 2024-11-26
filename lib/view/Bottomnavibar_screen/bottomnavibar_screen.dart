import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/view/Favouritescreen/favouritescreen.dart';
import 'package:newsapp/view/homescreen/homescreen.dart';
import 'package:newsapp/view/profilescreen/profilescreen.dart';

class BottomnavbarScreen extends StatefulWidget {
  const BottomnavbarScreen({super.key});

  @override
  State<BottomnavbarScreen> createState() => _BottomnavbarScreenState();
}

class _BottomnavbarScreenState extends State<BottomnavbarScreen> {
  int selecttab = 0;
  List screen = [
    Homescreen(),
    Favouritescreen(),
    Profilescreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          return Scaffold(
            body: screen[selecttab],
            bottomNavigationBar: BottomNavigationBar(
                onTap: (value) {
                  selecttab = value;
                  setState(() {});
                },
                type: BottomNavigationBarType.fixed,
                items: [
                  BottomNavigationBarItem(
                      activeIcon: Icon(Icons.home),
                      icon: Icon(Icons.home_outlined),
                      label: "HOME"),
                  BottomNavigationBarItem(
                      activeIcon: Icon(Icons.favorite),
                      icon: Icon(Icons.favorite_outline),
                      label: "FAVOURITE"),
                  BottomNavigationBarItem(
                      activeIcon: Icon(Icons.person),
                      icon: Icon(Icons.person_outline),
                      label: "PROFILE"),
                ]),
          );
        });
  }
}
