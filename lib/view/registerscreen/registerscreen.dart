import 'package:flutter/material.dart';
import 'package:newsapp/controller/signupcontroller.dart';
import 'package:newsapp/view/loginscreen/loginscreen.dart';
import 'package:provider/provider.dart';

class Signupscreen extends StatefulWidget {
  const Signupscreen({super.key});

  @override
  State<Signupscreen> createState() => _SignupscreenState();
}

class _SignupscreenState extends State<Signupscreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordconfirmController =
      TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              title(),
              SizedBox(height: 40),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    emailtextfield(),
                    SizedBox(height: 20),
                    passwordtextfield(),
                    SizedBox(height: 20),
                    confirmpasswordtextfield(),
                  ],
                ),
              ),
              SizedBox(height: 20),
              SizedBox(
                height: 50,
                width: double.infinity,
                child: context.watch<RegisterscreenController>().isloading
                    ? Center(child: CircularProgressIndicator())
                    : elevatedbutton(context),
              ),
              SizedBox(height: 40),
              loginsection(context),
              SizedBox(height: 30),
              Divider(
                color: Colors.black,
              ),
              SizedBox(height: 10),
              conditionsection(),
            ],
          ),
        ),
      ),
    );
  }

  Center title() {
    return Center(
      child: Text(
        "Sign up",
        style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  TextFormField emailtextfield() {
    return TextFormField(
      controller: emailController,
      decoration: InputDecoration(
        labelText: 'Email',
        hintText: ("Your email address"),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.grey, width: 3)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.blue, width: 3)),
      ),
      validator: (value) {
        if (value == null || !emailController.text.contains("@")) {
          return "Please enter a valid email address";
        }
        return null;
      },
    );
  }

  TextFormField passwordtextfield() {
    return TextFormField(
      controller: passwordController,
      decoration: InputDecoration(
        labelText: 'Password',
        hintText: ("Your Password"),
        suffix: Icon(Icons.remove_red_eye),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.grey, width: 3)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.blue, width: 3)),
      ),
      validator: (value) {
        if (passwordController.text.length < 5) {
          return "password must contain atleast 5 characters";
        } else if (value!.isEmpty) {
          return "enter password";
        } else {
          return null;
        }
      },
    );
  }

  TextFormField confirmpasswordtextfield() {
    return TextFormField(
      controller: passwordconfirmController,
      decoration: InputDecoration(
        label: Text("Confirm Passsword"),
        hintText: ("Your Confirm Password"),
        suffix: Icon(Icons.remove_red_eye),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.grey, width: 3)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.blue, width: 3)),
      ),
      validator: (value) {
        if (passwordconfirmController.text.isEmpty) {
          return "confirm password";
        } else if (passwordconfirmController.text != passwordController.text) {
          return "password do not match";
        } else {
          return null;
        }
      },
    );
  }

  ElevatedButton elevatedbutton(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        if (_formKey.currentState!.validate()) {
          context.read<RegisterscreenController>().onRegisteration(
              emailAddress: emailController.text,
              password: passwordController.text,
              context: context);
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => LoginScreen(),
              ));

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Registration Successful')),
          );
        }
      },
      style: ButtonStyle(backgroundColor: WidgetStatePropertyAll(Colors.blue)),
      child: Text(
        "sign up",
      ),
    );
  }

  Padding loginsection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Already have an account?", style: TextStyle(fontSize: 20)),
            TextButton(
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => LoginScreen()));
                },
                child: Text(
                  "login in",
                  style: TextStyle(color: Colors.blue),
                ))
          ],
        ),
      ),
    );
  }

  Row conditionsection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap: () {},
          child: Text("Conditions of use",
              style: TextStyle(
                color: Colors.blue,
              )),
        ),
        SizedBox(width: 15),
        InkWell(
          onTap: () {},
          child: Text("Privacy Notice",
              style: TextStyle(
                color: Colors.blue,
              )),
        ),
        SizedBox(width: 15),
        InkWell(
          onTap: () {},
          child: Text("Help",
              style: TextStyle(
                color: Colors.blue,
              )),
        ),
      ],
    );
  }
}
