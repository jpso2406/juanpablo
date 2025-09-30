import 'package:appblocycubit/bloc/inicio_sesion/inicio_session_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/services.dart';

class InitialWidget extends StatelessWidget {
  const InitialWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController cedulaController = TextEditingController();
    final TextEditingController nombreController = TextEditingController();

    return Scaffold(
      backgroundColor: const Color(0xFFF2F5F9),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 24),
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              gradient: const LinearGradient(
                colors: [Color(0xFF6A11CB), Color(0xFF2575FC)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 12,
                  offset: Offset(0, 6),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // 🔹 Título
                Text(
                  '🚀 Crear Cuenta',
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 24),

                // 🔹 Campo Cédula
                _CustomTextField(
                  controller: cedulaController,
                  label: "Cédula",
                  icon: Icons.credit_card,
                  maxLength: 10,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 16),

                // 🔹 Campo Nombre
                _CustomTextField(
                  controller: nombreController,
                  label: "Nombre",
                  icon: Icons.person,
                ),
                const SizedBox(height: 28),

                // 🔹 Botón
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: const Color(0xFF2575FC),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      elevation: 5,
                    ),
                    onPressed: () {
                      final cedula = cedulaController.text;
                      final nombre = nombreController.text;

                      if (cedula.isEmpty) {
                        context
                            .read<InicioSessionBloc>()
                            .add(FailedEvent("Cédula no puede estar vacía"));
                        return;
                      } else if (nombre.isEmpty) {
                        context
                            .read<InicioSessionBloc>()
                            .add(FailedEvent("Nombre no puede estar vacío"));
                        return;
                      }

                      if (cedula.length < 8) {
                        context.read<InicioSessionBloc>().add(
                            FailedEvent("Cédula debe tener al menos 8 dígitos"));
                        return;
                      } else if (nombre.length < 3) {
                        context.read<InicioSessionBloc>().add(FailedEvent(
                            "Nombre debe tener al menos 3 caracteres"));
                        return;
                      }

                      print('Cédula: $cedula, Nombre: $nombre');
                      context
                          .read<InicioSessionBloc>()
                          .add(CrearCuentaEvent(cedula, nombre));
                    },
                    child: const Text(
                      '✨ Crear',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// 🔹 Campo de texto personalizado
class _CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final IconData icon;
  final int? maxLength;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;

  const _CustomTextField({
    required this.controller,
    required this.label,
    required this.icon,
    this.maxLength,
    this.inputFormatters,
    this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      maxLength: maxLength,
      inputFormatters: inputFormatters,
      keyboardType: keyboardType,
      style: const TextStyle(color: Colors.white),
      cursorColor: Colors.white,
      decoration: InputDecoration(
        counterText: "",
        prefixIcon: Icon(icon, color: Colors.white70),
        labelText: label,
        labelStyle: const TextStyle(color: Colors.white70),
        floatingLabelStyle: const TextStyle(color: Colors.white),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.white70, width: 1.2),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.white, width: 2),
        ),
      ),
    );
  }
}
