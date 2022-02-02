import 'package:flutter/material.dart';
import 'package:my_hostel/HomePage.dart';
import 'package:my_hostel/SignUp.dart';
import 'package:my_hostel/Start.dart';
import 'package:my_hostel/login.dart';
import 'package:firebase_core/firebase_core.dart';


// void main(){ runApp(MyApp();
//     };

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.orange
      ),
      debugShowCheckedModeBanner: false,
      home: Start(),
    );
  }
}

