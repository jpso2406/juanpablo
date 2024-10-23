import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() => runApp(Homes());

class Homes extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp( 
      title: 'Home',
      home: Scaffold( 
        appBar: AppBar( 
          title: Center( child: Text('Welcome')),
          backgroundColor: Color.fromARGB(255, 18, 167, 154),
          foregroundColor: const Color.fromARGB(255, 0, 0, 0),
        ),
        body: Center( 
          child: Column( 
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Introduce numero de ID de 1 a 10'),
              Text(''),
              SizedBox( 
                width: 50,
                child: TextField( 
                  decoration: InputDecoration( 
                    border: OutlineInputBorder(),
                    hintText: 'ID',
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Text(''),
              Text(''),
              FloatingActionButton( 
                backgroundColor: Color.fromARGB(255, 18, 167, 154),
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SecondScreen(),
                    ),
                    (route) => false,
                  );
                },
                child: Icon(Icons.arrow_forward),
              ),
            ],
          )
        ),
      )
    )
  }

}