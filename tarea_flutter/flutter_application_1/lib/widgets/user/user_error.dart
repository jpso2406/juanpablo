import 'package:flutter/material.dart';

class UserError extends StatelessWidget {
  const UserError({super.key});

  @override
     Widget build(BuildContext context) {
      return Container(
        padding: const EdgeInsets.all(12),
        height: 200,
        width: double.infinity,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 212, 11, 11),
          border: Border.all(color: Colors.red),
          borderRadius: BorderRadius.circular(8),
        ),
        child: const Center(
          child:Text("❌ Error cargando usuario", style: TextStyle(color: Color.fromARGB(255, 0, 0, 0))),
        ),
      );
  }
}