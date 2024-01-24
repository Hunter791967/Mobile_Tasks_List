
import 'package:flutter/material.dart';

import 'alert_page.dart';
import 'alert_button.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    String appTitle = 'TASKS TO-DO LIST';
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white70,
        appBar: AppBar(
          title: Text(appTitle,
            style: const TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.white)
            ),
          backgroundColor: Colors.deepOrange,
          centerTitle: true,
          toolbarHeight: 70,
        ),
        body: const AlertText(),


        )

    );
  }
}