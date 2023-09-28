import 'package:flutter/material.dart';
import 'init_page.dart';

void main() async {
  runApp(const MyApp());
} 

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'animated_menu',
      theme: ThemeData(
        fontFamily: "MyFont",
        primarySwatch: Colors.blue,
        
      ),
      home:  const HomeView(),
    ); 
  }
}
