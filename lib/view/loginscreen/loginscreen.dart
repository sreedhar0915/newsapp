import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:newsapp/controller/loginscreen_controller.dart';
import 'package:newsapp/view/Bottomnavibar_screen/bottomnavibar_screen.dart';

import 'package:newsapp/view/registerscreen/registerscreen.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          return Scaffold(
            body: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      "Sign in",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 40),
                  Form(
                    key: formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: emailController,
                          decoration: InputDecoration(
                            labelText: 'Email',
                            hintText: ("Your email address"),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide:
                                    BorderSide(color: Colors.grey, width: 3)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide:
                                    BorderSide(color: Colors.blue, width: 3)),
                          ),
                        ),
                        SizedBox(height: 20),
                        TextFormField(
                          controller: passwordController,
                          decoration: InputDecoration(
                            labelText: 'Password',
                            hintText: ("Your Password"),
                            suffix: Icon(Icons.remove_red_eye),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide:
                                    BorderSide(color: Colors.grey, width: 3)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide:
                                    BorderSide(color: Colors.blue, width: 3)),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 40),
                  SizedBox(
                    height: 50,
                    width: double.infinity,
                    child: context.watch<LoginscreenController>().isloading
                        ? Center(child: CircularProgressIndicator())
                        : ElevatedButton(
                            onPressed: () {
                              context.read<LoginscreenController>().onLogin(
                                  emailAddress: emailController.text,
                                  Passsword: passwordController.text,
                                  context: context);
                              // Add login logic here
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => BottomnavbarScreen(),
                                  ));
                            },
                            style: ButtonStyle(
                                backgroundColor:
                                    WidgetStatePropertyAll(Colors.blue)),
                            child: Text(
                              "sign in",
                            ),
                          ),
                  ),
                  SizedBox(height: 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Don't have an account?",
                          style: TextStyle(fontSize: 20)),
                      SizedBox(
                        width: 10,
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Signupscreen(),
                                ));
                          },
                          child: Text(
                            "Register",
                            style: TextStyle(color: Colors.blue),
                          ))
                    ],
                  )
                ],
              ),
            ),
          );
        });
  }
}
