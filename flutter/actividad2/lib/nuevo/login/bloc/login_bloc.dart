import 'package:bloc/bloc.dart';


part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<LoginEvent>((event, emit) {
      emit(LoginInitial());
    });

    on<LoginRetryEvent>((event, emit) async{
      emit(LoginInitial());

    });

    on<CreateUserEvent>((event, emit) async {
      emit(LoginLoading());

      await Future.delayed(Duration(seconds: 1));

      emit(LoginSuccess(event.nombre));
    });
  }
}