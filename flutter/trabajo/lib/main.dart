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
          fillColor: Colors.grey[900],
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          labelStyle: const TextStyle(color: Colors.white70),
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
              colors: [Colors.indigo, Colors.deepPurple],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Center(
            child: SingleChildScrollView(
              child: Card(
                color: Colors.black.withOpacity(0.8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                elevation: 8,
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.account_circle,
                          size: 100, color: Colors.white),
                      const SizedBox(height: 20),

                      // Campo Nombre
                      TextField(
                        controller: campo2,
                        style: const TextStyle(color: Colors.white),
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.person, color: Colors.white70),
                          labelText: 'Nombre Usuario',
                        ),
                      ),
                      const SizedBox(height: 15.0),

                      // Campo Contraseña
                      BlocBuilder<FormBloc, FormularioState>(
                        builder: (context, state) {
                          return Column(
                            children: [
                              TextField(
                                controller: campo1,
                                style: const TextStyle(color: Colors.white),
                                obscureText: true,
                                keyboardType: TextInputType.number,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly,
                                  LengthLimitingTextInputFormatter(10),
                                ],
                                decoration: const InputDecoration(
                                  prefixIcon:
                                      Icon(Icons.lock, color: Colors.white70),
                                  labelText: 'Contraseña',
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

                      const SizedBox(height: 25.0),

                      // Botón ingresar
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
                                backgroundColor: Colors.indigo,
                                foregroundColor: Colors.white, //  texto en blanco
                                overlayColor: Colors.indigoAccent, //  efecto presionado
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
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
                                "Ingresar ",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white, //  forzado en blanco
                                ),
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
      ),
    );
  }
}
