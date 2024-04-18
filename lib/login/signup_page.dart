import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mind_mate_project/home_page.dart';

class SignUpPage extends StatelessWidget {
  //const SignUpPage({super.key});
  //const SignUpPage({Key? key}) : super(key: key);
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create an Account"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           const Text(
              "Sign Up",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),

             TextField(
              controller: emailController,
              decoration: const InputDecoration(
                labelText: "Email",
                border: OutlineInputBorder(),
              ),
              obscureText: false,
            ),
            const SizedBox(height: 20),
             TextField(
              controller: passwordController,
              decoration:  const InputDecoration(
                labelText: "Password",
                border: OutlineInputBorder(),
              ),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                FirebaseAuth.instance.createUserWithEmailAndPassword(
                    email: emailController.text,
                    password: passwordController.text).then((value) =>
                    Navigator.pushReplacement(
                        context, MaterialPageRoute(
                        builder: (context)=>const HomePage())
                    )
                ).onError((error, stackTrace) => {
                  print("Error ${error.toString()}")
                });
              },
              child: const Text("Sign Up"),
            ),
          ],
        ),
      ),
    );
  }
}

