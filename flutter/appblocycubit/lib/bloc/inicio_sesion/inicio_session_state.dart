part of 'inicio_session_bloc.dart';

sealed class InicioSessionState extends Equatable {
  const InicioSessionState();
  
  @override
  List<Object> get props => [];
}

final class InicioSessionInitial extends InicioSessionState {}

final class InicioSessionLoading extends InicioSessionState {}

final class InicioSessionFailed extends InicioSessionState {
  final String errorText;

  const InicioSessionFailed(this.errorText);

  @override
  List<Object> get props => [errorText];
}

final class InicioSessionSuccess extends InicioSessionState {
  final String cedula;
  final String nombre;

  const InicioSessionSuccess(this.cedula, this.nombre);

  @override
  List<Object> get props => [cedula, nombre];
}