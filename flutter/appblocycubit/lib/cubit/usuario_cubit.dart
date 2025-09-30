import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart' as http;

import '../model/usuario.dart';

part 'usuario_state.dart';

class UsuarioCubit extends Cubit<UsuarioState> {
  UsuarioCubit() : super(UsuarioInitial());

  Future<void> getUsuarios() async {
    emit(UsuarioLoading());

    await Future.delayed(Duration(seconds: 2));

    try {
      final response = await http.get(Uri.parse('https://dummyjson.com/users'));

      if (response.statusCode == 200) {
        final decode = jsonDecode(response.body);
        final List usuarios = decode['users'];

        final users = usuarios
            .whereType<Map<String, dynamic>>()
            .map((e) => Usuario.fromJson(e))
            .toList();
        emit(UsuarioSuccess(users));
      } else {
        emit(
          UsuarioFailed(
            "Error en la conexion, Codigo error: ${response.statusCode}",
          ),
        );
      }
    } catch (e) {
      emit(UsuarioFailed("Error al realizar la petición: $e"));
    }
  }
}
