import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/bloc.dart'; // FormBloc
import 'home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter con Bloc',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.grey[100],
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide.none,
          ),
          hintStyle: const TextStyle(color: Colors.black45),
        ),
      ),
      home: BlocProvider(
        create: (_) => FormBloc(),
        child: const MyHomePage(title: 'Inicio de sesión'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController campo1 = TextEditingController(); // contraseña
  final TextEditingController campo2 = TextEditingController(); // nombre

  @override
  Widget build(BuildContext context) {
    return BlocListener<FormBloc, FormularioState>(
      listener: (context, state) {
        if (state is FormularioGuardado) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Lista de sus clientes."),
              backgroundColor: Colors.green,
            ),
          );

          campo1.clear();
          campo2.clear();

          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Home(datos: state.datos)),
          );
        } else if (state is FormularioError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Row(
                children: [
                  const Icon(Icons.error, color: Colors.white),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      state.mensaje,
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ),
              backgroundColor: Colors.redAccent,
              behavior: SnackBarBehavior.floating,
              margin: const EdgeInsets.all(16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              duration: const Duration(seconds: 3),
            ),
          );
        }
      },
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFFF9FAFB), Color(0xFFE5E7EB)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Center(
            child: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(28),
                margin: const EdgeInsets.symmetric(horizontal: 24),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 12,
                      spreadRadius: 2,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Avatar
                    const CircleAvatar(
                      radius: 45,
                      backgroundColor: Colors.indigo,
                      child: Icon(Icons.person, size: 60, color: Colors.white),
                    ),
                    const SizedBox(height: 30),

                    // Campo Nombre
                    TextField(
                      controller: campo2,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.person, color: Colors.black54),
                        hintText: "Nombre Usuario",
                      ),
                    ),
                    const SizedBox(height: 18),

                    // Campo Contraseña
                    BlocBuilder<FormBloc, FormularioState>(
                      builder: (context, state) {
                        return Column(
                          children: [
                            TextField(
                              controller: campo1,
                              obscureText: true,
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                                LengthLimitingTextInputFormatter(10),
                              ],
                              decoration: const InputDecoration(
                                prefixIcon:
                                    Icon(Icons.lock, color: Colors.black54),
                                hintText: "Contraseña",
                              ),
                            ),
                            if (state is FormularioError)
                              Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Text(
                                  state.mensaje,
                                  style: const TextStyle(
                                      color: Colors.redAccent, fontSize: 14),
                                ),
                              ),
                          ],
                        );
                      },
                    ),

                    const SizedBox(height: 25),

                    // Botón Ingresar
                    BlocBuilder<FormBloc, FormularioState>(
                      builder: (context, state) {
                        if (state is FormularioGuardando) {
                          return const CircularProgressIndicator(
                              color: Colors.indigo);
                        }
                        return SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 14),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              backgroundColor: Colors.indigo,
                              foregroundColor: Colors.white,
                            ),
                            onPressed: () {
                              context.read<FormBloc>().add(
                                    GuardarFormulario(
                                      cedula: campo1.text.trim(),
                                      nombre: campo2.text.trim(),
                                    ),
                                  );
                            },
                            child: const Text(
                              "Ingresar",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
