import 'package:flutter/material.dart';
import 'package:mind_mate_project/quiz/main1.dart';
import 'package:mind_mate_project/temprary.dart';

class HomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text("Home page"),
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
                Navigator.push(context, MaterialPageRoute(builder: (context)=>FeatureInProgressPage()));
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
              child: const Text("Emotional Fitness check"),
            ),
          ),
          const SizedBox(height: 20,),
          SizedBox(
            height: 50,
            width: double.infinity,

            child: ElevatedButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>FeatureInProgressPage()));
              },
              child: const Text("Talk Now (Schedule Your Session)"),
            ),
          ),
        ],
      ),
    );
  }

}