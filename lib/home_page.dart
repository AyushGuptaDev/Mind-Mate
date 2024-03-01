import 'package:flutter/material.dart';

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
              onPressed: (){},
              child: const Text("MindMate Assistant "),
            ),
          ),
          const SizedBox(height: 20,),
          SizedBox(
            height: 50,
            width: double.infinity,

            child: ElevatedButton(
              onPressed: (){},
              child: const Text("Emotional Fitness check"),
            ),
          ),
          const SizedBox(height: 20,),
          SizedBox(
            height: 50,
            width: double.infinity,

            child: ElevatedButton(
              onPressed: (){},
              child: const Text("Talk Now (Schedule Your Session)"),
            ),
          ),
        ],
      ),
    );
  }

}