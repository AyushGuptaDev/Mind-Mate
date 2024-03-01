import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mind_mate_project/quiz/Answer_botton.dart';
import 'package:mind_mate_project/quiz/style_data.dart';
import 'package:mind_mate_project/quiz/quiz_data.dart';
import 'package:mind_mate_project/quiz/result_screen.dart';

List<String> selectedAnswer=[];
class quizScreen extends StatefulWidget{
  const quizScreen({super.key});
  @override
  State<quizScreen> createState() => _quizScreenState();
}

class _quizScreenState extends State<quizScreen>{
  //List<String> selectedAnswer=[];
  var index=0;


  void onSelectAnswer(String ClickedAnswer){
    setState(() {
      selectedAnswer.add(ClickedAnswer);
      print(selectedAnswer[index]);
      index++;
      if(questions.length==index){
        Navigator.pushReplacement
          (context, MaterialPageRoute
          (builder: (context)=> const ResultScreen()
        ));
      }
    });
  }

  // void  ontapRestart (){
  //   Navigator.pushReplacement(context, MaterialPageRoute(builder:(context)=>const StaringPage()));
  //   print("presed");
  //   // setState(() {
  //   //
  //   // });
  // }


  @override
  Widget build(BuildContext context) {
    final currentQuestion=questions[index];
    return Container(
      width: double.infinity,
      decoration: backgroundColour(),
      child: Container(
        //decoration: backgroundColour(),
        margin:const  EdgeInsets.all(45),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(currentQuestion.question,
              style:GoogleFonts.lato(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 25,
                decoration: TextDecoration.none
              ),
            ),

            const SizedBox(height: 30,),
             ... currentQuestion.shuffleOption().map((item) {
              return AnswerBotton(
                  ontap: () => onSelectAnswer(item),
                  choosedAnswer: (item)
              );
            })
          ],
        ),
      ),
    );
  }
}
