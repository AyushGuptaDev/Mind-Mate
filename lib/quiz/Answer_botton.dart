import 'dart:ffi';

import 'package:flutter/material.dart';

class AnswerBotton extends StatelessWidget{
  const AnswerBotton({required this.ontap,required this.choosedAnswer,super.key});
  final void Function() ontap;
  final String choosedAnswer;
  @override
  Widget build(context){
    return ElevatedButton(onPressed: ontap,
        child: Text(choosedAnswer)
    );
  }
}