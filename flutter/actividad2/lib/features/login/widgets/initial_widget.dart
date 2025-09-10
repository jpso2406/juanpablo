// ignore: file_names
import 'package:actividad2/features/login/bloc/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InitialWidget extends StatelessWidget {
  final TextEditingController cedulaController = TextEditingController();
  final TextEditingController nombreController = TextEditingController();

  InitialWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Fondo degradado
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF2196F3), Color(0xFF64B5F6)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Card(
            elevation: 12,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            color: Colors.white.withOpacity(0.95),
            margin: const EdgeInsets.symmetric(horizontal: 24),
            child: Padding(
              padding: const EdgeInsets.all(28.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.lock_outline, size: 60, color: Colors.blueAccent),
                  const SizedBox(height: 16),

                  Text(
                    "Iniciar Sesión",
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.blueAccent,
                        ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 32),

                  // Campo de Cédula
                  TextField(
                    maxLength: 10,
                    cursorColor: Colors.blueAccent,
                    controller: cedulaController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: "Cédula",
                      prefixIcon: const Icon(Icons.badge_outlined),
                      filled: true,
                      fillColor: Colors.blue.shade50,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Colors.blueAccent, width: 2),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      counterText: "", // quita el contador de caracteres
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Campo de Nombre
                  TextField(
                    cursorColor: Colors.blueAccent,
                    controller: nombreController,
                    decoration: InputDecoration(
                      labelText: "Nombre",
                      prefixIcon: const Icon(Icons.person_outline),
                      filled: true,
                      fillColor: Colors.blue.shade50,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Colors.blueAccent, width: 2),
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                  const SizedBox(height: 28),

                  // Botón
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        final cedulaText = cedulaController.text.trim();
                        final nombre = nombreController.text.trim();

                        if (cedulaText.isEmpty || nombre.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('Todos los campos son obligatorios')),
                          );
                          return;
                        }

                        if (cedulaText.length < 8 || nombre.length < 3) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text("Por favor ingrese datos válidos")),
                          );
                          return;
                        }

                        final cedula = int.tryParse(cedulaText) ?? 0;
                        context
                            .read<LoginBloc>()
                            .add(CreateUserEvent(cedula: cedula, nombre: nombre));
                      },
                      icon: const Icon(Icons.person_add, color: Colors.white),
                      label: const Text(
                        "Crear Usuario",
                        style: TextStyle(color: Colors.white),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blueAccent,
                        padding: const EdgeInsets.symmetric(
                            vertical: 18, horizontal: 24),
                        textStyle: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
