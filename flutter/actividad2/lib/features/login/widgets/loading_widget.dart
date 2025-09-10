// ignore: file_names
import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 70,
          height: 70,
          child: CircularProgressIndicator(
            color: Colors.blueAccent,
            strokeWidth: 8,
          ),
        ),
        SizedBox(height: 20),
        Text("Cargando...", style: TextStyle(fontSize: 24),),
      ],
    );
  }
}