import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/login_bloc.dart';

class FailedWidget extends StatelessWidget {
  const FailedWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.error_outline,
            color: Colors.red,
            size: 48,
          ),
          const SizedBox(height: 12),
          Text(
            'Ha sucedido un error en el registro',
            style: TextStyle(
              fontSize: 18,
              color: Colors.red,
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 18),
          ElevatedButton.icon(
            onPressed: () {
              context.read<LoginBloc>().add(LoginRetryEvent());
            },
            icon: Icon(Icons.refresh),
            label: Text('Reintentar'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
              textStyle: const TextStyle(fontSize: 15),
            ),
          ),
        ],
      ),
    );
  }
}