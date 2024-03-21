

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mind_mate_project/home_page.dart';
import 'package:mind_mate_project/quiz/Quiz.dart';
import 'package:mind_mate_project/quiz/answer_summary.dart';
import 'package:mind_mate_project/quiz/style_data.dart';
import 'package:mind_mate_project/quiz/quiz_data.dart';
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
        'correctAnswer0': questions[i].options[0],
        'correctAnswer1': questions[i].options[1],
        'correctAnswer2': questions[i].options[2],
        'correctAnswer3': questions[i].options[3],
        'correctAnswer4': questions[i].options[4],
      });
    }
     return Summary;
  }


  @override
  Widget build(BuildContext context) {

    var summaryData= getSummaryData();
    final int totalQuestion=questions.length;
    // final int totalscore=0; summaryData.where((item) {
    //   return item['coosenAnswer']==item['correctAnswer1'];
    // }).length;
    int totalscore=0;


    int Score(){
        for (int i = 0; i < questions.length; i++) {
          var item=summaryData[i];
          if (item['coosenAnswer'] == item['correctAnswer0']) {
            totalscore=totalscore+0;
          }
          else if (item['coosenAnswer'] == item['correctAnswer1']) {
            totalscore=totalscore+1;
          }
          else if (item['coosenAnswer'] == item['correctAnswer2']) {
            totalscore=totalscore+2;
          }
          else if (item['coosenAnswer'] == item['correctAnswer3']) {
            totalscore=totalscore+3;
          }
          else if (item['coosenAnswer'] == item['correctAnswer4']) {
            totalscore=totalscore+4;
          }
        }

      return totalscore;
    }
    String returStatement(){
      Score();
      if(totalscore<=13){
        return "low stress or no stress \n Maintain healthy habits, seek social support, and engage in personal growth activities.";
      }
      else if(totalscore>13 && totalscore<=26) {
        return "moderate stress \n Develop coping strategies, seek therapy, and prioritize self-care.";
      }
      else  {
        return "high perceived stress\n Seek immediate professional support, establish safety plans, and prioritize healing and recovery.";
      }
    }
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
            child: Text ("${returStatement()}",style: GoogleFonts.lato(
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
          ElevatedButton(
              onPressed: (){
                Navigator.pushReplacement(context, MaterialPageRoute(builder:(context)=>const HomePage()));
                print(selectedAnswer);
                selectedAnswer=[];
              },
            child: const Text("Finish test"),
            // style: ButtonStyle(
            //   backgroundColor:
            // ),
          )
        ],
      ),
    );
  }
}