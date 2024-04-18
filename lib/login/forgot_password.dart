import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ForgotPassword extends StatelessWidget{
  ForgotPassword({super.key});
  final TextEditingController email=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("change your password"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: email,
            decoration: const InputDecoration(
              hintText: "enter your email"
            ),
          ),

          ElevatedButton(onPressed: (){
            FirebaseAuth.instance.sendPasswordResetEmail(email: email.text);
          },
            child: const Text("forgot password")
          ),
        ],
      ),
    );
  }

}
