import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Global {
  static const Color blue = const Color(0xff00C9FF);
  static const Color green = const Color(0xff92FE9D);
}

// final fstyle = TextStyle(
//   fontFamily: 'Roboto',
// );

TextStyle mystyle(double size, [Color color, FontWeight fw ]) {
  return TextStyle(
    fontFamily: 'Roboto',
    fontSize: size,
    color: color,
    fontWeight: fw,
  );
}

const doctors = 'assets/svg/doctors.svg';
const search = 'assets/svg/search.svg';

CollectionReference usercollection = FirebaseFirestore.instance.collection('user');
CollectionReference blogcollection = FirebaseFirestore.instance.collection('blogs');
