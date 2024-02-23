
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget{
  const LoginPage({super.key});
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text("Login Page"),
      ),
      body: Container(
        color: Colors.blueGrey,
        child: Center(
          // margin:const  EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 350,
              child: TextField(
                keyboardType: TextInputType.emailAddress,
                obscureText: false,
                decoration: textFieldDecoration(
                  prefix: const Icon(Icons.email_outlined),
                  hint: "Enter your Email id",
                  suffix: const Text("@gmail.com"),
                ),
              ),
            ),
            const SizedBox(height: 20,),
            SizedBox(
              width: 350,
              child: TextField(
                keyboardType: TextInputType.visiblePassword,
                obscureText: true,
                decoration: textFieldDecoration(
                  hint: "Enter your password "
                ),
              ),
            ),
            const SizedBox(height: 20,),

            ElevatedButton(onPressed: (){},
                child: const Text("login"),
            )
          ],
        ),
        ),
      ),
    );
  }
}










InputDecoration textFieldDecoration({Widget? prefix,String? hint,Widget? suffix}){
  return  InputDecoration(
    focusedBorder: OutlineInputBorder(
      borderSide: const BorderSide(
        color: Color.fromARGB(235, 31, 3, 191),
        width: 5
      ),
      borderRadius: BorderRadius.circular(11),
    ),



  enabledBorder: OutlineInputBorder(
  borderSide: const BorderSide(
  color: Color.fromARGB(235, 52, 237, 0),
  width: 5
  ),
  borderRadius: BorderRadius.circular(11),
  ),

    //prefix: prefix,
    prefixIcon: prefix,
    hintText: hint,
    suffix: suffix


  );
}