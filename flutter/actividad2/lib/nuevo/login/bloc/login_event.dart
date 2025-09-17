part of 'login_bloc.dart';

sealed class LoginEvent extends Equatable {
  const LoginEvent();

  List<Object> get props => [];
}

class LoginRetryEvent extends LoginEvent {}

class CreateUserEvent extends LoginEvent {
  final int cedula;
  final String nombre;

  const CreateUserEvent({required this.cedula, required this.nombre});

  @override
  List<Object> get props => [cedula, nombre];
}