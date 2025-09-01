import 'package:flutter/material.dart';

class TaskError extends StatelessWidget {
  const TaskError({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      height: 100,
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 15, 14, 14), // 🎨 Color de fondo
        border: Border.all(color: Colors.black54),
        borderRadius: BorderRadius.circular(8),
      ),
      child: const Center(
        child: Text(
          "❌ Error cargando tareas de usuario",
          style: TextStyle(color: Colors.red),
        ),
      ),
    );
  }
}