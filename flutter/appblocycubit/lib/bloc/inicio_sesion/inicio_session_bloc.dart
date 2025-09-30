import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'inicio_session_event.dart';
part 'inicio_session_state.dart';

class InicioSessionBloc extends Bloc<InicioSessionEvent, InicioSessionState> {
  InicioSessionBloc() : super(InicioSessionInitial()) {
    on<InicioSessionEvent>((event, emit) {
      emit(InicioSessionInitial());
    });

    on<InitialEvent>((event, emit) {
      emit(InicioSessionInitial());
    });

    on<CrearCuentaEvent>((event, emit) async {
      emit(InicioSessionLoading());
      
      await Future.delayed(Duration(seconds: 3));

      emit(InicioSessionSuccess(event.cedula, event.nombre));
    });

    on<FailedEvent>((event, emit) {
      emit(InicioSessionFailed(event.errorText));
    });
  }
}
