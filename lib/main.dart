import 'package:flutter/material.dart';

import 'app_screens/main_activity.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Sarasmart",
      home:new MyActivity(),
    );
  }
}


