import 'package:flutter/material.dart';
import 'package:phonehospital/screens/splash_page/splash_page.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return  MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.light(),
      home: SplashPage(),

    );
  }
}