import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:actividad2/features/login/bloc/login_bloc.dart';

class InitialWidget extends StatelessWidget {
  final TextEditingController cedulaController = TextEditingController();
  final TextEditingController nombreController = TextEditingController();

  InitialWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: isDark
                ? [Colors.deepPurple.shade900, Colors.purple.shade700]
                : [const Color(0xFF8E24AA), const Color(0xFFF06292)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 600),
              curve: Curves.easeOut,
              margin: const EdgeInsets.symmetric(horizontal: 24),
              padding: const EdgeInsets.all(28),
              decoration: BoxDecoration(
                color: isDark
                    ? Colors.black.withOpacity(0.8)
                    : Colors.white.withOpacity(0.9),
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.15),
                    blurRadius: 25,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Hero(
                    tag: "logo",
                    child: CircleAvatar(
                      radius: 45,
                      backgroundColor: Colors.purple.shade100,
                      child: const Icon(Icons.lock_outline,
                          size: 50, color: Colors.purple),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "Bienvenido",
                    style: GoogleFonts.poppins(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.purple,
                    ),
                  ),
                  const SizedBox(height: 35),

                  // Campo Cédula
                  _buildFancyTextField(
                    label: "Cédula",
                    icon: Icons.badge_outlined,
                    controller: cedulaController,
                    keyboardType: TextInputType.number,
                    maxLength: 10,
                  ),
                  const SizedBox(height: 22),

                  // Campo Nombre
                  _buildFancyTextField(
                    label: "Nombre",
                    icon: Icons.person_outline,
                    controller: nombreController,
                  ),
                  const SizedBox(height: 32),

                  // Botón con gradiente
                  SizedBox(
                    width: double.infinity,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [Color(0xFFF06292), Color(0xFF8E24AA)],
                        ),
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.purple.withOpacity(0.3),
                            blurRadius: 10,
                            offset: const Offset(0, 5),
                          ),
                        ],
                      ),
                      child: ElevatedButton(
                        onPressed: () {
                          final cedulaText = cedulaController.text.trim();
                          final nombre = nombreController.text.trim();

                          if (cedulaText.isEmpty || nombre.isEmpty) {
                            _showSnack(context,
                                'Todos los campos son obligatorios');
                            return;
                          }

                          if (cedulaText.length < 8 || nombre.length < 3) {
                            _showSnack(context,
                                'Por favor ingrese datos válidos');
                            return;
                          }

                          final cedula = int.tryParse(cedulaText) ?? 0;
                          context.read<LoginBloc>().add(
                                CreateUserEvent(
                                    cedula: cedula, nombre: nombre),
                              );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          shadowColor: Colors.transparent,
                          padding: const EdgeInsets.symmetric(
                              vertical: 16, horizontal: 32),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: const [
                            Icon(Icons.person_add, color: Colors.white),
                            SizedBox(width: 8),
                            Text("Crear Usuario",
                                style: TextStyle(color: Colors.white)),
                          ],
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

  Widget _buildFancyTextField({
    required String label,
    required IconData icon,
    required TextEditingController controller,
    TextInputType keyboardType = TextInputType.text,
    int? maxLength,
  }) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      maxLength: maxLength,
      cursorColor: Colors.purple,
      style: GoogleFonts.poppins(fontSize: 16),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: GoogleFonts.poppins(color: Colors.purple.shade400),
        prefixIcon: Icon(icon, color: Colors.purple),
        filled: true,
        fillColor: Colors.purple.shade50.withOpacity(0.6),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide:
              const BorderSide(color: Colors.purple, width: 2),
        ),
        counterText: "",
      ),
    );
  }

  void _showSnack(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message, style: GoogleFonts.poppins()),
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.redAccent,
      ),
    );
  }
}
