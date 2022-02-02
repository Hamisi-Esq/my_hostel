import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_hostel/Start.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final FirebaseAuth _auth= FirebaseAuth.instance;
  User? user;
  bool isloggedin = false;

  checkAuthentification() async{
    _auth.authStateChanges().listen((user) {
      if(user == null)
        {
          Navigator.push(context, MaterialPageRoute(builder: (context)=> Start()));
        }
    } );
  }
  getUser() async{
    User firebaseUser = await _auth.currentUser!;
    await firebaseUser.reload();
    firebaseUser = await _auth.currentUser!;

    if(firebaseUser != null){
      setState(() {
        this.user= firebaseUser;
        this.isloggedin = true;
      });
    }
  }
  signOut()async{
    _auth.signOut();
  }
  @override
  void initState(){
    this.checkAuthentification();
    this.getUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: !isloggedin? CircularProgressIndicator():
        Column(
          children: [
            Container(
              height: 400,
              child: Image(image: AssetImage('images/welcome.jpg'),
              fit: BoxFit.contain,
              ),
            ),
            Container(
              child: Text('Hello you are logged in as ${user!.email}',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              )
              ),
            ),
            RaisedButton(
                onPressed: signOut,
                padding: EdgeInsets.fromLTRB(70, 10, 70, 10),

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

    );
  }
}

