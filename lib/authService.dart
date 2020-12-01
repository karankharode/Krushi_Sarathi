import 'package:Krushi_Sarathi/Screens/LoginPage.dart';
import 'package:Krushi_Sarathi/Screens/tabsscreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'Screens/LoginPage.dart';
import 'Screens/HomePage.dart';

class AuthServices {
  handleAuth() {
    return StreamBuilder(
        stream: FirebaseAuth.instance.onAuthStateChanged,
        builder: (BuildContext context, snapshot) {
          if (snapshot.hasData) {
            return TabsScreen();
          } else {
            return LoginPage();
          }
        });
  }

  //Sign-Out
  signOut() {
    FirebaseAuth.instance.signOut();
  }

  //Sign-In
  signIn(AuthCredential authCreds) {
    FirebaseAuth.instance.signInWithCredential(authCreds);
  }
}
