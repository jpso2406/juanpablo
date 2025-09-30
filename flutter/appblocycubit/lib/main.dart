
import 'package:appblocycubit/views/inicioSessionViews.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "flutter bloc",
      home: InicioSessionViews(),
    );
  }

}