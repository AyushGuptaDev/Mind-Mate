
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mind_mate_project/login/forgot_password.dart';
import 'package:mind_mate_project/home_page.dart';
import 'package:mind_mate_project/login/signup_page.dart';

class LoginPage extends StatefulWidget{
  const LoginPage({super.key});
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var emailid=TextEditingController();
  var password=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text("UNLOCK YOUR INNER STRENGTH"),
      ),
      body: Container(
        color:const  Color.fromARGB(255, 252, 252, 252),
        child: Center(
          // margin:const  EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //const SizedBox(height: 20,),
            ClipOval(
              child: SizedBox(
                height: 100,
                width: 300,
                  child: Image.asset('assest/image/Mind_made_update_logo.jpg')),
            ),
            const SizedBox(height: 30,),
            SizedBox(
              width: 350,
              child: TextField(
                controller: emailid,
                keyboardType: TextInputType.emailAddress,
                obscureText: false,
                decoration: textFieldDecoration(
                  prefix: const Icon(Icons.email_outlined),
                  hint: "Enter your Email id",
                  //suffix: const Text("@gmail.com"),
                ),
              ),
            ),
            const SizedBox(height: 20,),
            SizedBox(
              width: 350,
              child: TextField(
                controller: password,
                keyboardType: TextInputType.visiblePassword,
                obscureText: true,
                decoration: textFieldDecoration(
                  hint: "Enter your password ",
                  prefix:const  Icon(Icons.lock)
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>ForgotPassword()));
                    },
                    child: const Text(
                      "Forgot Password?",
                      style: TextStyle(
                        color: Colors.blue, // Change the color to match your theme
                        fontSize: 16, // Adjust the font size as needed
                        fontWeight: FontWeight.bold, // Make the text bold
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20,),

            ElevatedButton(
              onPressed: (){
                FirebaseAuth.instance.signInWithEmailAndPassword(
                    email: emailid.text,
                    password: password.text).then((value) {
                      Navigator.pushReplacement(
                          context,MaterialPageRoute(builder: (context) => const HomePage())
                      ).onError((error, stackTrace) {
                        showDialog(context: context, builder: (ctx)=>AlertDialog(
                                title:const  Text("Invalid Input"),
                                content: const Text("Make sure you have valid mail id and password "),
                                actions: [
                                  TextButton(
                                      onPressed:() {
                                        Navigator.pop(ctx);
                                      },
                                      child:const Text("ok"))
                                ],
                              ));
                      });
                });
                // if(emailid.text.trim()=="ayush"&& password.text.trim()=="12345") {
                //   Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => HomePage()));
                // }
                // else{
                //   showDialog(context: context, builder: (ctx)=>AlertDialog(
                //     title:const  Text("Invalid Input"),
                //     content: const Text("Make sure you have valid mail id and password "),
                //     actions: [
                //       TextButton(
                //           onPressed:() {
                //             Navigator.pop(ctx);
                //
                //           },
                //           child:const Text("ok"))
                //     ],
                //   ));
                // }
              },
                child: const Text("login"),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SignUpPage()));
              },
              child: const Text(
                "Create an Account",
                style: TextStyle(
                  color: Colors.blue, // Change the color to match your theme
                  fontSize: 16, // Adjust the font size as needed
                  fontWeight: FontWeight.bold, // Make the text bold
                ),
              ),
            ),
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
  color: Color.fromARGB(235, 188, 228, 181),
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

