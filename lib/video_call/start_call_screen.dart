import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mind_mate_project/video_call/zego_cloud.dart';

class StartCallScreen extends StatefulWidget{
  const StartCallScreen({super.key});
  @override
  State<StartCallScreen> createState() => _StartCallScreenState();
}

class _StartCallScreenState extends State<StartCallScreen> {


   var email;
   var slot;
   var id;
   @override
   void initState() {
     super.initState();
     getDetails();
   }

  void getDetails ()async{
    final user=FirebaseAuth.instance.currentUser;
    print(user);
    if (user!= null){
      DocumentSnapshot dataSnapshort=await FirebaseFirestore.instance.collection('users').
      doc(user.uid).get();

      if(dataSnapshort.exists){
        final userdata=dataSnapshort.data() as Map<String,dynamic>;
        email=userdata['email'];
        slot=userdata['booked slot'];
        id=user.uid;
        print("$email $slot $id");
        setState(() {

        });
      }
      else(
      print("nahi hua ")
      );

    }else(
        print("nahi hua first hi")
    );


  }

  @override
  Widget build(BuildContext context) {
   return SizedBox(
     child: Column(
       children: [
         Text('Booking details: $slot \n and booking mail id is $email'),

         ElevatedButton(onPressed: (){
           Navigator.push(context, MaterialPageRoute(builder: (context)=>VidioCall(userid: id, username: email)));
         }, child: const Text("Start session")
         )
       ],
     ),
   );
  }
}