import 'package:flutter/material.dart';
import 'package:newsapp/view/homescreen/homescreen.dart';

class Favouritescreen extends StatelessWidget {
  const Favouritescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Saved news"),
        actions: [
          Icon(Icons.newspaper),
          SizedBox(width: 20),
        ],
      ),
      body: Column(
        children: [
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                prefix: Icon(Icons.search),
                iconColor: Colors.black,
                hintText: "Search News",
                suffix: Icon(Icons.newspaper),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.blue, width: 3)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.grey, width: 3)),
              ),
            ),
          ),
          SizedBox(height: 20),
          Container(
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 80,
                    backgroundImage:
                        AssetImage("assets/images/news-removebg-preview.png"),
                  ),
                  SizedBox(width: 20),
                  Column(
                    children: [
                      Text(
                        "Your saved news are\nempty",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 25),
                      Text(
                        "Pick up where you left off",
                        style: TextStyle(color: Colors.blue, fontSize: 18),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Center(
                child: SizedBox(
              height: 50,
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Homescreen(),
                        ));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                  ),
                  child: Center(
                      child: Text(
                    "Continue to saving news",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w400),
                  ))),
            )),
          )
        ],
      ),
    );
  }
}
