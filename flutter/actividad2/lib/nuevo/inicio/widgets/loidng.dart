import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 50,
            height: 50,
            child: CircularProgressIndicator(
              color: Colors.blueAccent,
              strokeWidth: 6,
            ),
          ),
          SizedBox(height: 20),
          Text("Cargando...", style: TextStyle(fontSize: 24),),
        ],
      ),
    );
  }
}