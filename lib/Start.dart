import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:my_hostel/SignUp.dart';
import 'package:my_hostel/login.dart';
import 'package:my_hostel/SignUp.dart';
class Start extends StatefulWidget {
  const Start({Key? key}) : super(key: key);

  @override
  _StartState createState() => _StartState();
}

class _StartState extends State<Start> {
  navigateToLogin()async{
    Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
  }
  navigateToRegister()async{
    Navigator.push(context, MaterialPageRoute(builder: (context) => SignUp()));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            SizedBox(height: 20.0,),
            Container(
            height: 400,
              child: Image(image: AssetImage("images/realestate.png"),
              fit:BoxFit.contain,
              ),
            ),
            SizedBox(height: 50,),
            RichText(
              text: TextSpan(
                text: 'Welcome to ', style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold,
              color: Colors.black
              ),
                children: <TextSpan>[
                  TextSpan(
                    text: 'My Hostel', style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.orange
                  )
                  )
                ]
              ),
            ),
            SizedBox(height: 20,),
            Text('New Hostels Delivered at Your Doorstep', style: TextStyle(color: Colors.black),),
            SizedBox(height: 30,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RaisedButton(
                  padding: EdgeInsets.only(left: 30, right: 30),
                    onPressed: navigateToLogin,
                child: Text('LOGIN', style: TextStyle(fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
                ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                    color: Colors.orange
                ),
                SizedBox(width: 20,),
                RaisedButton(
                    padding: EdgeInsets.only(left: 30, right: 30),
                    onPressed: navigateToRegister,
                    child: Text('REGISTER', style: TextStyle(fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    color: Colors.orange
                ),
              ],
            ),
            SizedBox(height: 20,),
            // with custom text
            SignInButton(
              Buttons.Google,
              text: "Sign up with Google",
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}
