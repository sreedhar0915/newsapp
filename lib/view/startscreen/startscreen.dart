import 'package:flutter/material.dart';
import 'package:newsapp/view/languagescreen/languagescreen.dart';

class Startscreen extends StatelessWidget {
  const Startscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("assets/images/pexels-photo-1883530.webp"),
              )),
            ),
            Getstartbutton(context),
          ],
        ),
      ),
    );
  }

  Positioned Getstartbutton(BuildContext context) {
    return Positioned(
      bottom: 20,
      right: 0,
      left: 0,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: InkWell(
          onTap: () {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => LanguageScreen()));
          },
          child: Container(
            height: 50,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Center(
                child: Text(
              "GET's START...",
              style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
            )),
          ),
        ),
      ),
    );
  }
}
