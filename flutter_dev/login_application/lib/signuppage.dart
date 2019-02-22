import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'services/usermanagement.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  
  
  String _email;
  String _password;
  String _firstname;
  String _lastname;
  String _phonenumber;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: EdgeInsets.all(25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                decoration: InputDecoration(hintText: 'Email'),
                onChanged: (value){
                  setState(() {
                    _email = value;
                  });
                },),
                SizedBox(height: 15.0,),
              TextField(
                decoration: InputDecoration(hintText: 'Password'),
                onChanged: (value){
                  setState(() {
                    _password = value;
                  });
                },
                obscureText: true,
              ),
               SizedBox(height: 15.0,),
              TextField(
                decoration: InputDecoration(hintText: 'First Name'),
                onChanged: (value){
                  setState(() {
                    _firstname = value;
                  });
                },
              ),
               SizedBox(height: 15.0,),
              TextField(
                decoration: InputDecoration(hintText: 'Last Name'),
                onChanged: (value){
                  setState(() {
                    _lastname = value;
                  });
                },
              ),
               SizedBox(height: 15.0,),
              TextField(
                decoration: InputDecoration(hintText: 'Phonenumber'),
                onChanged: (value){
                  setState(() {
                    _phonenumber = value;
                  });
                },
              ),
              
                
                SizedBox(height: 15.0),
                Text('Dont\'t have an account?'),
                SizedBox(height: 10.0),
                RaisedButton(
                child: Text('Sign Up'),
                color: Colors.blue,
                textColor: Colors.white,
                elevation: 7.0,
                onPressed: (){
                  FirebaseAuth.instance.createUserWithEmailAndPassword(
                    email: _email,
                    password: _password
                  ).then((signedInUser){
                    UserManagement().storeNewUser(signedInUser,context,_firstname,_lastname,_phonenumber);
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