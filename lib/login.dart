import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:my_hostel/HomePage.dart';
import 'package:my_hostel/SignUp.dart';

class Login extends StatefulWidget {

  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GlobalKey<FormState> _formkey = GlobalKey <FormState>();

  late String _email, _password;
  checkAuthentification() async {
    _auth.authStateChanges().listen((user) {
      if (user != null) {
        print(user);

        Navigator.pushReplacementNamed(context, "/");
      }
    });
  }

  checkAuthentication() async{
    _auth.authStateChanges().listen((user) {
      if(user!= null){
        Navigator.push(context, MaterialPageRoute(builder:(context) =>HomePage()));

      }

    });
    @override
    void initState(){
      super.initState();
      // Firebase.initializeApp();
      // Firebase.initializeApp().whenComplete(() {
      //   print("completed");
      //   setState(() {});
      // });
      WidgetsFlutterBinding.ensureInitialized();
      Firebase.initializeApp();
      this.checkAuthentication();
    }
  }
  login() async {
    if (_formkey.currentState!.validate()) {
      _formkey.currentState!.save();

      try {
        UserCredential user = await _auth.signInWithEmailAndPassword(
            email: _email.toString().trim(), password: _password.toString().trim());
      } catch (e) {
        showError(e.toString());
        print(e);
      }
    }
  }
  showError(String errormessage) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('ERROR'),
            content: Text(errormessage),
            actions: <Widget>[
              FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('OK'))
            ],
          );
        });
  }

  navigateToSignUp() async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => SignUp()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Container(
                height: 400,
                child: Image(image: AssetImage('images/login.jpg'),
                fit: BoxFit.contain,
                ),
              ),
              Container(
                child: Form(
                  key: _formkey,
                  child: Column(
                    children: [
                      Container(
                        child: TextFormField(
                          validator: (input){
        if(input!.isEmpty)
        return 'Enter Email';
        },
                            decoration: InputDecoration(
                              labelText: 'Email',
                              prefixIcon: Icon(Icons.email)
                            ),
                            onSaved: (input) => _email = input! ),
                      ),
                      Container(
                        child: TextFormField(
                            validator: (input){
        if(input!.length < 6)
        return 'Provide a password of a minimum of 6 Characters';
        },
                              decoration: InputDecoration(
                                  labelText: 'Password',
                                  prefixIcon: Icon(Icons.lock),
                              ),
                              obscureText: true,
                              onSaved: (input) => _password = input!


                        ),
                      ),
                      SizedBox(height: 20),
                      RaisedButton(
                        padding: EdgeInsets.fromLTRB(70, 10, 70, 10),
                        onPressed: login,
                        child: Text('LOGIN',style: TextStyle(color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold),),
                        color: Colors.orange,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0)
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 40,),
              GestureDetector(
                child: Text('Create an Account?'),
                onTap: navigateToSignUp,
              )
            ],
          ),
        ),
      ),
    );
  }
}
