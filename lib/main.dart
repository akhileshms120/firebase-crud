import 'package:firebase/home_screen.dart';
import 'package:firebase/update.dart';
import 'package:firebase/view.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      //home: HomePage(),
      initialRoute:'update',
      routes: {
        '/':(context) => HomePage(),
        '/view':(context) => ViewPage(),
        //'/update':(context) => UpdatePage(value: '',)
      },
    );
  }
}
