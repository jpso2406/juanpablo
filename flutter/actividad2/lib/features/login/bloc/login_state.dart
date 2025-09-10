part of 'login_bloc.dart';


sealed class LoginState extends Equatable {
  const LoginState();
  
  List<Object> get props => [];
}

class Equatable {
  const Equatable();
}

final class LoginInitial extends LoginState {}

final class LoginLoading extends LoginState {}

final class LoginFailed extends LoginState {}

final class LoginSuccess extends LoginState {
  final String nombre;
  const LoginSuccess(this.nombre);

  @override
  List<Object> get props => [nombre];
}