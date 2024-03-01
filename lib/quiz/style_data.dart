import 'package:flutter/material.dart';

// Gradient backgroundColour(){
//   return LinearGradient(
//     colors: [
//       Color.fromARGB(255, 29, 39, 247),
//       Color.fromARGB(255, 23, 184, 4)
//     ],
//     begin: Alignment.topLeft,
//     end: Alignment.bottomRight
//   );
// }

Decoration backgroundColour
    () {

  return const BoxDecoration(
    gradient: LinearGradient(
        colors: [
          Color.fromARGB(255, 29, 39, 247),
          Color.fromARGB(255, 23, 184, 4)
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight
    )
  );
}

TextStyle resultScreenDataQuestion({Color fill = Colors.cyan,}){
  return   TextStyle(
    decoration: TextDecoration.none,
    fontSize: 20,
    color: fill,

  );
}