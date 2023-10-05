import 'package:flutter/material.dart';
import 'package:tugas2pam/welcome_page.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: WelcomePage(),
    );
  }
}

/*leading: IconButton(
icon: Icon(Icons.home),
onPressed: () {
Navigator.of(context).pushReplacement(
MaterialPageRoute(builder: (context) => WelcomePage()),
);
},
),*/

