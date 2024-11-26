import 'package:flutter/material.dart';
import 'package:newsapp/main.dart';
import 'package:newsapp/view/profilescreen/profile_editscreen.dart';

class Profilescreen extends StatelessWidget {
  const Profilescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("My Profile",
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black)),
        actions: [
          Icon(Icons.person_sharp),
          SizedBox(width: 10),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => ProfileEditscreen(),
              ));
        },
        child: Icon(Icons.person_add_alt_1),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 60,
                  backgroundColor: Colors.blue,
                  child: Center(
                      child: Icon(
                    Icons.person,
                    size: 50,
                  )),
                ),
              ],
            ),
            SizedBox(height: 20),
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 20),
            //   child: Text("Email: ${email} ",
            //       style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            // ),
            // Divider(thickness: 2, color: Colors.blue),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text("Name: ${name} ",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ),
            Divider(thickness: 2, color: Colors.blue),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text("address: ${address} ",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ),
            Divider(thickness: 2, color: Colors.blue),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text("age: ${age} ",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ),
            Divider(thickness: 2, color: Colors.blue),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text("phone no: ${phoneno} ",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ),
            Divider(thickness: 2, color: Colors.blue),
            SizedBox(height: 30),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Need more help?",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                SizedBox(height: 10),
                InkWell(
                  onTap: () {},
                  child: Container(
                    height: 50,
                    width: 200,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: Colors.blue)),
                    child: Center(
                        child: Text(
                      "Visit Customer Services",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
