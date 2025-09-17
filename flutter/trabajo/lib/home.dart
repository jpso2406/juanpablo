import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/usuarios_bloc.dart';
import 'widgets/loading.dart';

class Home extends StatelessWidget {
  final Map<String, dynamic> datos;
  final bool mostrarSnack;
  const Home({super.key, required this.datos, this.mostrarSnack = false});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => UsuariosBloc()..add(CargarUsuarios()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Datos de la persona"),
          backgroundColor: Colors.indigo,
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Imagen + nombre
              Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.asset(
                      'assets/images/carro.png',
                      width: 120,
                      height: 120,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    "Bienvenido, ${datos["Nombre"]}",
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.indigo,
                        ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),

              // Lista de usuarios de la API
              Expanded(
                child: BlocBuilder<UsuariosBloc, UsuariosState>(
                  builder: (context, state) {
                    if (state is UsuariosCargando) {
                      return const Center(child: Loading());
                    } else if (state is UsuariosErrorState) {
                      return Center(
                        child: Text(
                          state.mensaje,
                          style: const TextStyle(color: Colors.red),
                        ),
                      );
                    } else if (state is UsuariosCargados) {
                      final usuarios = state.usuarios;
                      return ListView.separated(
                        itemCount: usuarios.length,
                        separatorBuilder: (_, __) => const Divider(),
                        itemBuilder: (context, index) {
                          final usuario = usuarios[index];
                          return Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            elevation: 2,
                            child: ListTile(
                              leading: CircleAvatar(
                                backgroundColor: Colors.indigo,
                                child: Text(
                                  (usuario["name"] as String).isNotEmpty
                                      ? usuario["name"][0]
                                      : "?",
                                  style: const TextStyle(color: Colors.white),
                                ),
                              ),
                              title: Text(
                                usuario["name"] ?? '',
                                style: const TextStyle(fontWeight: FontWeight.w600),
                              ),
                              subtitle: Text(usuario["email"] ?? ''),
                              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                            ),
                          );
                        },
                      );
                    }
                    return const Center(child: Text("Presione para cargar usuarios"));
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
