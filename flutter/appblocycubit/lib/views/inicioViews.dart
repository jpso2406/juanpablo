import 'package:appblocycubit/cubit/usuario_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/usuario/loadingWidget.dart';
import '../widgets/usuario/failedWidget.dart';
import '../widgets/usuario/successWidget.dart';

class InicioViews extends StatelessWidget {
  const InicioViews({super.key, required this.nombre, required this.cedula});

  final String nombre;
  final String cedula;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F5F9), 
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              // 
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(28),
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
                  children: [
                    const Icon(Icons.verified_user,
                        color: Colors.white, size: 60),
                    const SizedBox(height: 20),
                    const Text(
                      'Bienvenido 🚀',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      nombre,
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Documento: $cedula',
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.white70,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              // 🔹 Estado de usuarios
              BlocProvider(
                create: (context) => UsuarioCubit()..getUsuarios(),
                child: BlocBuilder<UsuarioCubit, UsuarioState>(
                  builder: (context, state) {
                    if (state is UsuarioLoading) {
                      return const LoadingWidget();
                    } else if (state is UsuarioFailed) {
                      return FailedWidget(texto: state.errorText);
                    } else if (state is UsuarioSuccess) {
                      return SuccessWidget(usuario: state.usuarios);
                    }
                    return const SizedBox.shrink();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
