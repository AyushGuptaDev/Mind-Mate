import 'package:flutter/material.dart';
import 'package:mind_mate_project/video_call/zego_cloud.dart';

class Saman extends StatelessWidget{
  final username=TextEditingController();
  final userid=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body:
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: username,
            decoration: const InputDecoration(
              hintText: "user name"
            ),
          ),
          TextField(
            controller: userid,
            decoration: InputDecoration(
              hintText: "id"
            ),
          ),
          ElevatedButton(
              onPressed: (){
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>VidioCall(userid: userid.text, username: username.text)));
              },
              child: const Text("Start video call")
          ),

        ],
        // heello, and i am aush and i am he
      ),

    );
  }

}

