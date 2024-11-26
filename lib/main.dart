import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/controller/homescreen_controller.dart';
import 'package:newsapp/controller/loginscreen_controller.dart';
import 'package:newsapp/controller/signupcontroller.dart';
import 'package:newsapp/view/firebaseoptions.dart';
import 'package:newsapp/view/splashscreen/splashscreen.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => LoginscreenController()),
        ChangeNotifierProvider(create: (context) => RegisterscreenController()),
        ChangeNotifierProvider(create: (context) => HomescreenController()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Splashscreen(),
      ),
    );
  }
}

String email = "";
String password = "";
String name = "";
String address = "";
String age = "";
String phoneno = "";


