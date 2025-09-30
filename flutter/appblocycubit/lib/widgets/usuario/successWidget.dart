import 'package:appblocycubit/model/usuario.dart' show Usuario;
import 'package:flutter/material.dart';

class SuccessWidget extends StatelessWidget {
  const SuccessWidget({super.key, required this.usuario});

  final List<Usuario> usuario;

  @override
  Widget build(BuildContext context) {
    const gradientColors = [Color(0xFF6A11CB), Color(0xFF2575FC)];

    return Container(
      color: Colors.white,
      child: ListView.builder(
        shrinkWrap: true, // 👈 evita altura infinita
        physics: const NeverScrollableScrollPhysics(), // 👈 desactiva scroll interno
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
        itemCount: usuario.length,
        itemBuilder: (context, index) {
          final user = usuario[index];
          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            elevation: 8,
            shadowColor: Colors.black26,
            margin: const EdgeInsets.symmetric(vertical: 12),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Avatar
                  CircleAvatar(
                    radius: 36,
                    backgroundImage: user.fotoPerfil != null && user.fotoPerfil!.isNotEmpty
                        ? NetworkImage(user.fotoPerfil!)
                        : null,
                    backgroundColor: gradientColors[0].withOpacity(0.1),
                    child: user.fotoPerfil == null || user.fotoPerfil!.isEmpty
                        ? Icon(Icons.person, size: 36, color: gradientColors[0])
                        : null,
                  ),
                  const SizedBox(width: 20),

                  // Información
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ShaderMask(
                          shaderCallback: (bounds) => const LinearGradient(
                            colors: gradientColors,
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ).createShader(bounds),
                          child: Text(
                            user.nombre ?? 'Sin nombre',
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white, // el degradado reemplaza este color
                            ),
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          user.email ?? 'Sin email',
                          style: const TextStyle(fontSize: 16, color: Colors.black87),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          user.telefono ?? 'Sin teléfono',
                          style: const TextStyle(fontSize: 16, color: Colors.black87),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          user.nombreUsuario ?? 'Sin usuario',
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.black54,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
