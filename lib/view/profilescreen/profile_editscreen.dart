import 'package:flutter/material.dart';
import 'package:newsapp/main.dart';
import 'package:newsapp/view/Bottomnavibar_screen/bottomnavibar_screen.dart';

class ProfileEditscreen extends StatelessWidget {
  const ProfileEditscreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController NameController = TextEditingController();
    TextEditingController addressController = TextEditingController();
    TextEditingController ageController = TextEditingController();
    TextEditingController phonenoController = TextEditingController();
    final _formKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Get's Start With Informations")),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          children: [
            Form(
              key: _formKey,
              child: Column(
                children: [
                  SizedBox(height: 30),
                  TextFormField(
                    controller: NameController,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 10),
                      hintText: "Name",
                      hintStyle: TextStyle(
                          color: Colors.blue,
                          fontSize: 16,
                          fontWeight: FontWeight.normal),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Colors.grey.shade400,
                          )),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: Color(0xff1a75d2),
                          )),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "enter name";
                      } else {
                        return null;
                      }
                    },
                  ),
                  SizedBox(height: 25),
                  TextFormField(
                    controller: addressController,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 10),
                      hintText: "Address",
                      hintStyle: TextStyle(
                          color: Colors.blue,
                          fontSize: 16,
                          fontWeight: FontWeight.normal),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Colors.grey.shade400,
                          )),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: Color(0xff1a75d2),
                          )),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "enter  address";
                      } else {
                        return null;
                      }
                    },
                  ),
                  SizedBox(height: 25),
                  TextFormField(
                    controller: ageController,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 10),
                      hintText: "Age",
                      hintStyle: TextStyle(
                          color: Colors.blue,
                          fontSize: 16,
                          fontWeight: FontWeight.normal),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Colors.grey.shade400,
                          )),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: Color(0xff1a75d2),
                          )),
                    ),
                    validator: (value) {
                      if (ageController.text.length < 2) {
                        return "enter correct age";
                      } else if (value!.isEmpty) {
                        return "enter age";
                      } else {
                        return null;
                      }
                    },
                  ),
                  SizedBox(height: 25),
                  TextFormField(
                    controller: phonenoController,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 10),
                      hintText: "Phone number",
                      hintStyle: TextStyle(
                          color: Colors.blue,
                          fontSize: 16,
                          fontWeight: FontWeight.normal),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Colors.grey.shade400,
                          )),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: Color(0xff1a75d2),
                          )),
                    ),
                    validator: (value) {
                      if (phonenoController.text.length < 10) {
                        return "enter valid phone number";
                      } else if (value!.isEmpty) {
                        return "enter password";
                      } else {
                        return null;
                      }
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 25),
            InkWell(
              onTap: () {
                if (_formKey.currentState!.validate()) {
                  name = NameController.text;
                  address = addressController.text;
                  age = ageController.text;
                  phoneno = phonenoController.text;
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => BottomnavbarScreen()));
                } else {}
              },
              child: Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Center(child: Text("START")),
              ),
            )
          ],
        ),
      ),
    );
  }
}
