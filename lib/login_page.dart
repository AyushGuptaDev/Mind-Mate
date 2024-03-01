
import 'package:flutter/material.dart';
import 'package:mind_mate_project/home_page.dart';

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
        color: Colors.blueGrey,
        child: Center(
          // margin:const  EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 350,
              child: TextField(
                controller: emailid,
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
                controller: password,
                keyboardType: TextInputType.visiblePassword,
                obscureText: true,
                decoration: textFieldDecoration(
                  hint: "Enter your password "
                ),
              ),
            ),
            const SizedBox(height: 20,),

            ElevatedButton(
              onPressed: (){
                if(emailid.text.trim()=="ayush"&& password.text.trim()=="12345") {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => HomePage()));
                }
                else{
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
                }
              },
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

