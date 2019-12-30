import 'package:flutter/material.dart';

class TextBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 7.0,

      child: Container(
        height: 30,
        alignment: Alignment.centerLeft,
        color: Colors.white,
        child: TextField(
          decoration: InputDecoration(
              suffixIcon: Icon(Icons.search),
              contentPadding: EdgeInsets.all(10.0),
              border: InputBorder.none,
              hintText: 'Search'),
        ),
      ),
    );
  }
}