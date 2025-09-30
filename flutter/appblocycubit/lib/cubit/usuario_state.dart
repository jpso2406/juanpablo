part of 'usuario_cubit.dart';

sealed class UsuarioState extends Equatable {
  const UsuarioState();

  @override
  List<Object> get props => [];
}




final class UsuarioInitial extends UsuarioState {}

final class UsuarioLoading extends UsuarioState {}

final class UsuarioFailed extends UsuarioState {
  final String errorText;

  const UsuarioFailed(this.errorText);

  @override
  List<Object> get props => [errorText];
}

final class UsuarioSuccess extends UsuarioState {
  final List<Usuario> usuarios;

  const UsuarioSuccess(this.usuarios);

  @override
  List<Object> get props => [usuarios];
}
