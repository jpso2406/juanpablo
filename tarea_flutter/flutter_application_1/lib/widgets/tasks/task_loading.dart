import 'package:flutter/material.dart';

class TaskLoading extends StatelessWidget {
  const TaskLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      height: 120,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.blue.shade50, // 🎨 Color de fondo
        border: Border.all(color: Colors.blue.shade50),
        borderRadius: BorderRadius.circular(8),
      ),
      child: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(),
            SizedBox(height: 10),
            Text(
              "⏳ Cargando tus tareas...",
              style: TextStyle(color: Colors.black87),
            ),
          ],
        ),
      ),
    );
  }
}