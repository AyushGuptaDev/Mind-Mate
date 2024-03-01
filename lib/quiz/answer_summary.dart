//
//
// import 'package:flutter/material.dart';
// import 'package:quiz_app_self_udemy/style_data.dart';
//
// class answerSumarry extends StatelessWidget{
//   const answerSumarry({required this.summary,super.key});
//   final List<Map<String,Object>>summary;
//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children:
//            summary.map((data) {
//             return
//                Row(
//                  mainAxisAlignment: MainAxisAlignment.start,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(((data['questionIndex']as int) + 1).toString(),style: ResultScreenDataQuestion()),
//
//                   Expanded(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       mainAxisAlignment: MainAxisAlignment.start,
//
//                       children: [
//                         const SizedBox(height: 20,),
//                         Text(data['questionText']as String,style: ResultScreenDataQuestion()),
//                         const SizedBox(height: 5,),
//                         Text(data['coosenAnswer']as String,style: ResultScreenDataQuestion()),
//                         const SizedBox(height: 3,),
//                         Text(data['correctAnswer']as String,style: ResultScreenDataQuestion()),
//                       ],
//                     ),
//                   )
//                 ],
//
//             );
//
//           }).toList()
//
//       ),
//     );
//   }
//
// }
import 'package:flutter/material.dart';
import 'package:mind_mate_project/quiz/style_data.dart';

class answerSumarry extends StatelessWidget {
  const answerSumarry({required this.summary, Key? key}) : super(key: key);


  final List<Map<String, Object>> summary;

  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: summary.map((data) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                ((data['questionIndex'] as int) + 1).toString(),
                style: resultScreenDataQuestion(),
              ),
              
              const SizedBox(width: 10), // Adjust as needed for spacing
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data['questionText'] as String,
                      style: resultScreenDataQuestion(),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      'Chosen Answer: ${data['coosenAnswer']}',
                      style: resultScreenDataQuestion(fill: Colors.lightBlueAccent),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      'Correct Answer: ${data['correctAnswer']}',
                      style: resultScreenDataQuestion(fill: Colors.pink),
                    ),
                  ],
                ),
              )
            ],
          );
        }).toList(),
      ),
    );
  }
}



//     return SingleChildScrollView(
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: summary.map((data) {
//           return Padding(
//             padding: const EdgeInsets.symmetric(vertical: 8.0),
//             child: Row(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   ((data['questionIndex'] as int) + 1).toString(),
//                   style: resultScreenDataQuestion(),
//                 ),
//                 SizedBox(width: 10), // Adjust as needed
//                 Expanded(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         data['questionText'] as String,
//                         style: resultScreenDataQuestion(),
//                       ),
//                       const SizedBox(height: 5),
//                       Text(
//                         'Chosen Answer: ${data['coosenAnswer']}',
//                         style: resultScreenDataQuestion(),
//                       ),
//                       const SizedBox(height: 3),
//                       Text(
//                         'Correct Answer: ${data['correctAnswer']}',
//                         style: resultScreenDataQuestion(),
//                       ),
//                     ],
//                   ),
//                 )
//               ],
//             ),
//           );
//         }).toList(),
//       ),
//     );
//   }
// }