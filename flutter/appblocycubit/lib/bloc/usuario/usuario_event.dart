part of 'usuario_bloc.dart';

sealed class UsuarioEvent extends Equatable {
  const UsuarioEvent();

  @override
  List<Object> get props => [];
}

class getUsuarioEvent extends UsuarioEvent {}