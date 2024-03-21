
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
                      'Chosen option: ${data['coosenAnswer']}',
                      style: resultScreenDataQuestion(fill: Colors.lightBlueAccent),
                    ),
                    const SizedBox(height: 3),
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


