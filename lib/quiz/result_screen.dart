

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mind_mate_project/quiz/Quiz.dart';
import 'package:mind_mate_project/quiz/answer_summary.dart';
import 'package:mind_mate_project/quiz/style_data.dart';
import 'package:mind_mate_project/quiz/quiz_data.dart';
import 'package:mind_mate_project/quiz/main1.dart';

class ResultScreen extends StatelessWidget{
  const ResultScreen({super.key});
  //final List<String> choosenAnswer;
  //final void Function() ontapRe;

  List<Map<String,Object>>getSummaryData(){
    List<Map<String,Object>> Summary=[];
    for (int i=0;i<questions.length;i++){
      Summary.add({
        'questionIndex': i,
        'questionText': questions[i].question,
        'coosenAnswer': selectedAnswer[i],
        'correctAnswer': questions[i].options[0],
      });
    }
     return Summary;
  }


  @override
  Widget build(BuildContext context) {

    var summaryData= getSummaryData();
    final int totalQuestion=questions.length;
    final int correctAnswer= summaryData.where((item) {
      return item['coosenAnswer']==item['correctAnswer'];
    }).length;

    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: backgroundColour(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        //crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            margin:const  EdgeInsets.all(10),
            child: Text ("No of correct answer is $correctAnswer out of $totalQuestion",style: GoogleFonts.lato(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.none
            ),),
          ),
          const SizedBox(height: 30,),
          Container(
            alignment: Alignment.topLeft,
              //color: Colors.white,
              //width: 300,
              height: 500,
              margin:const  EdgeInsets.all(20),
              child: answerSumarry(summary: summaryData,)
            ),
          const SizedBox(height: 30,),
          ElevatedButton.icon(
              onPressed: (){
                Navigator.pushReplacement(context, MaterialPageRoute(builder:(context)=>const StaringPage()));
                print(selectedAnswer);
                selectedAnswer=[];
              },
              icon:const  Icon(Icons.restart_alt_sharp),
              label: const Text("restart")
          )
        ],
      ),
    );
  }
}