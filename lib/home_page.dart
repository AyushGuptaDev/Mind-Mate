import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mind_mate_project/chatbot/chatbot_screen.dart';
import 'package:mind_mate_project/login/login_page.dart';
import 'package:mind_mate_project/quiz/main1.dart';
import 'package:mind_mate_project/video_call/slot_booking.dart';
import 'package:mind_mate_project/video_call/booking_info_screen.dart';
import 'package:mind_mate_project/video_call/start_call_screen.dart';

class HomePage extends StatelessWidget{
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      // appBar: AppBar(
      //   title: const Text("Home page"),
      // ),
      appBar:AppBar(
        title: const Text("Home page"),
        actions: [
          DropdownButton(
            onChanged: (String? value) {
              if (value == 'logout') {
                FirebaseAuth.instance.signOut().then((value) {
                  print("logout ho chuka");
                  Navigator.pushReplacement(
                      context, MaterialPageRoute(
                      builder: (context)=>const LoginPage()));
                });
              }
            },
            items: const [
              DropdownMenuItem(
                value: 'logout',
                child:  Text('Logout'),
              ),
            ],
          ),
        ],
      ),
      body: Column(

        crossAxisAlignment: CrossAxisAlignment.center,
       // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 20,),
          SizedBox(
            height: 50,
            width: double.infinity,

            child: ElevatedButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>const ChatbotScreen()));
              },
              child: const Text("MindMate Assistant "),
            ),
          ),
          const SizedBox(height: 20,),
          SizedBox(
            height: 50,
            width: double.infinity,

            child: ElevatedButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>StaringPage()));
              },
              child: const Text("Mental Fitness check"),
            ),
          ),
          const SizedBox(height: 20,),
          SizedBox(
            height: 50,
            width: double.infinity,

            child: ElevatedButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> const SlotBooking()));
              },

              child: const Text("Schedule Your Session"),
            ),
          ),
      const SizedBox(height: 20,),
      SizedBox(
        height: 50,
        width: double.infinity,

        child: ElevatedButton(
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=> const StartCallScreen()));
          },

          child: const Text("Start video call"),
        ),
      )
        ],
      ),
    );
  }
}