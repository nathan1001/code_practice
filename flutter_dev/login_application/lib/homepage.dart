import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('Dashboard'),
          centerTitle: true,
        ),
        body: Center(
          child: Container(
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Text('Welcome to our new application, Loggend In'),
                SizedBox(
                  height: 15.0,
                ),
                new OutlineButton(
                  borderSide: BorderSide(
                    color: Colors.red,style:BorderStyle.solid,width:3.0
                  ),
                  child: Text('Logout'),
                  onPressed: (){
                    FirebaseAuth.instance
                    .signOut()
                    .then((value){
                      Navigator
                      .of(context)
                      .pushReplacementNamed('/landingpage');
                    })
                    .catchError((e){
                      print(e);
                    });
                  },
                )
              ],
            ),
          ),
        ),
    );
  }
}