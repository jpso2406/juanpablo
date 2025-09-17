import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../nuevo/login/bloc/login_bloc.dart';
import '../nuevo/login/accesos.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Inicio de Sesión"),
        centerTitle: true,
      ),
      body: BlocProvider(
        create: (_) => LoginBloc(),
        child: const LoginBody(),
      ),
    );
  }
}

class LoginBody extends StatelessWidget {
  const LoginBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(16),
      child: LoginContainer(),
    );
  }
}