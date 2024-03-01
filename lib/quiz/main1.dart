import 'package:flutter/material.dart';
 import 'package:mind_mate_project/quiz/Quiz.dart';
 import 'package:mind_mate_project/quiz/style_data.dart';
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: ('quiz app'),
//       theme: ThemeData(primarySwatch: Colors.orange),
//       home: const StaringPage(),
//     );
//   }
// }

class StaringPage extends StatelessWidget {
  const StaringPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: backgroundColour(),
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //const SizedBox(height: 10,),
            Image.asset('assest/image/quiz-logo.png'),
            const SizedBox(height: 70,),
            ElevatedButton.icon
              (onPressed: (){
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const quizScreen()));
            },
                icon: const Icon(Icons.arrow_right_alt),
                label: const Text ("Start Quiz"))
          ],
        ),
      ),
    );
  }
}
