import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:insta_clone/provider/user_provider.dart';
import 'package:provider/provider.dart';
import 'package:insta_clone/model/user.dart' as model;


class mobileScreenLayout extends StatefulWidget {
  const mobileScreenLayout({super.key});

  @override
  State<mobileScreenLayout> createState() => _mobileScreenLayoutState();
}

class _mobileScreenLayoutState extends State<mobileScreenLayout> {
 


  @override
  Widget build(BuildContext context) {
    model.User user=Provider.of<UserProvider>(context).getUser;
    return Scaffold(
      body: Center(
        child: Text(user.email),
      ),
    );
  }
}
