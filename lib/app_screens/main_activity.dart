import 'package:flutter/material.dart';
import 'package:sarasmart/classes/app_bar.dart';


class MyActivity extends StatefulWidget {
  @override
  _MyActivityState createState() => _MyActivityState();
}

class _MyActivityState extends State<MyActivity> {
  bool typing = false;


  @override
  Widget build(BuildContext context) {
    return AppBarClass();
  }


}



