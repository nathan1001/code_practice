import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class UserManagement{


  storeNewUser(user,context,firstname,lastname,phonenumber){
    Firestore.instance.collection('/users').add({
      'email':user.email,
      'uid':user.uid,
      'firstname':firstname,
      'lastname':lastname,
      'phonenumber':phonenumber
    }).then((value){
      Navigator.of(context).pop();
      Navigator.of(context).pushReplacementNamed('/homepage');
    }).catchError((e){
      print(e);
    });
  }
}   