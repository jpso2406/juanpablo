import 'package:appblocycubit/bloc/inicio_sesion/inicio_session_bloc.dart';
import 'package:appblocycubit/views/inicioViews.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

import '../widgets/inicioSession/initialWidget.dart';
import '../widgets/inicioSession/loadingWidget.dart';
import '../widgets/inicioSession/failedWidget.dart';

class InicioSessionViews extends StatelessWidget {
  const InicioSessionViews({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF6A11CB), Color(0xFF2575FC)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: BlocProvider(
          create: (context) => InicioSessionBloc(),
          child: BlocConsumer<InicioSessionBloc, InicioSessionState>(
            listener: (context, state) {
              if (state is InicioSessionSuccess) {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (_) => InicioViews(
                      nombre: state.nombre,
                      cedula: state.cedula,
                    ),
                  ),
                );
              }
            },
            builder: (context, state) {
              if (state is InicioSessionInitial) {
                return const InitialWidget();
              } else if (state is InicioSessionLoading) {
                return const LoadingWidget();
              } else if (state is InicioSessionFailed) {
                return FailedWidget(texto: state.errorText);
              } else {
                return const SizedBox.shrink();
              }
            },
          ),
        ),
      ),
    );
  }
}
