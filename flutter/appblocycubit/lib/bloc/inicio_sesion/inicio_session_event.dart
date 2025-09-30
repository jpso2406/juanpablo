part of 'inicio_session_bloc.dart';

sealed class InicioSessionEvent extends Equatable {
  const InicioSessionEvent();

  @override
  List<Object> get props => [];
}

final class CrearCuentaEvent extends InicioSessionEvent {
  final String cedula;
  final String nombre;

  const CrearCuentaEvent(this.cedula, this.nombre);
  
  @override
  List<Object> get props => [cedula, nombre];
}

final class FailedEvent extends InicioSessionEvent {
  final String errorText;

  const FailedEvent(this.errorText);

  @override
  List<Object> get props => [errorText];
}

final class InitialEvent extends InicioSessionEvent {}