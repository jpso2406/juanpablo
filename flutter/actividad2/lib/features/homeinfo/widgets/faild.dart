import 'package:flutter/material.dart';

class FailedWidget extends StatelessWidget {
  const FailedWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.error, color: Colors.red, size: 48,),
          SizedBox(height: 20),
          Text("Error al cargar la información", style: TextStyle(fontSize: 24, color: Colors.red),),
          SizedBox(height: 20),
          ElevatedButton.icon(
            onPressed: () {
              // context.read<HomeInfoBloc>().add(RetryHomeInfo());
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
              textStyle: const TextStyle(fontSize: 15),
            ),
            icon: Icon(Icons.refresh, color: Colors.white,),
            label: Text("Reintentar", style: TextStyle(color: Colors.white),),
          ),
        ],
      ),
    );
  }
}