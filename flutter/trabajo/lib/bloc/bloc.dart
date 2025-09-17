import 'package:flutter_bloc/flutter_bloc.dart';

// Eventos
abstract class FormEvent {}

class GuardarFormulario extends FormEvent {
  final String cedula; // contraseña
  final String nombre;

  GuardarFormulario({required this.cedula, required this.nombre});
}

// Estados
abstract class FormularioState {}

class FormularioInitial extends FormularioState {}

class FormularioGuardando extends FormularioState {}

class FormularioGuardado extends FormularioState {
  final Map<String, dynamic> datos;
  FormularioGuardado(this.datos);
}

class FormularioError extends FormularioState {
  final String mensaje;
  FormularioError(this.mensaje);
}

// Bloc
class FormBloc extends Bloc<FormEvent, FormularioState> {
  // Cambia esta por tu contraseña única
  static const String _passwordUnica = "123456";

  FormBloc() : super(FormularioInitial()) {
    on<GuardarFormulario>((event, emit) async {
      emit(FormularioGuardando());

      await Future.delayed(const Duration(seconds: 1));

      if (event.cedula.isEmpty || event.nombre.isEmpty) {
        emit(FormularioError(" Debes llenar todos los campos"));
      } else if (event.cedula != _passwordUnica) {
        emit(FormularioError(" La contraseña es incorrecta"));
      } else {
        final datos = {
          "Nombre": event.nombre,
          "Cedula": event.cedula,
        };
        emit(FormularioGuardado(datos));
      }
    });
  }
}
