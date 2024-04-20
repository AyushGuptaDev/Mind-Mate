

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mind_mate_project/home_page.dart';

class ProfileScreen extends StatefulWidget {

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late User? _user;
  // late Map<String, dynamic> _userData = {};
  var userEmail;
  var Bookedslot;

  @override
  void initState() {
    super.initState();
    _getUserData();
  }
  Future<void> _getUserData() async {
    _user = FirebaseAuth.instance.currentUser;

    if (_user != null) {
      DocumentSnapshot userSnapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc(_user!.uid)
          .get();

      print('User UID: ${_user!.uid}'); // Debug print

      if (userSnapshot.exists) {
        final _userData = userSnapshot.data() as Map<String, dynamic>;
        userEmail = _userData['email'];
        Bookedslot=_userData['booked slot'];


        print('User data: ${userEmail}'); // Debug print

        setState(() {

        });
      } else {
        print('User document does not exist'); // Debug print
      }
    }
  }
  // Future<void> _getUserData() async {
  //   // Get current user
  //   _user = FirebaseAuth.instance.currentUser;
  //
  //   if (_user != null) {
  //     // Retrieve user data from Firestore
  //     DocumentSnapshot userSnapshot = await FirebaseFirestore.instance
  //         .collection('users')
  //         .doc(_user!.uid)
  //         .get();
  //
  //     setState(() {
  //       _userData = userSnapshot.data() as Map<String, dynamic>;
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Center(
        child: _user != null
            ? Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            //Text('Name: ${_userData['name']}'),
            const Text('You have successfully booked the Consilling session '),
            Text('Booking details: $Bookedslot \n and booking mail id is $userEmail'),


            ElevatedButton(onPressed: (){
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomePage()));
            },
              child: const Text("ok"),
            )
          ],
        )
            : const Text('User not logged in'),

      ),
    );
  }
}



