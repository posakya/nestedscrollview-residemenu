import 'package:flutter/material.dart';

class CurveBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(50.0),
          bottomRight: Radius.circular(50.0)),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [Colors.blue, Colors.red]),
          boxShadow: [
            BoxShadow(
                color: Color.fromARGB(60, 0, 0, 0),
                blurRadius: 5.0,
                offset: Offset(5.0, 5.0))
          ],
        ),
        height: 250.0,
        width: double.infinity,

      ),
    );
  }
}