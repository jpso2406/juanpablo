import 'package:flutter/material.dart';

class UserInitial extends StatelessWidget {
  const UserInitial({super.key});

  @override
    Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      height: 200,
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black54),
        borderRadius: BorderRadius.circular(8),
      ),
      child: const Center(
        child:Text("Usuario:"),
      ),
    );
  }
}