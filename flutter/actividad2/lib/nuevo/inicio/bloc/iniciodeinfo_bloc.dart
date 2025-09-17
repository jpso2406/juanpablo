import 'dart:convert';

// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
// ignore: depend_on_referenced_packages
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;
import '../../../models/user.dart';

part 'iniciodeinfo_event.dart';
part 'iniciodeinfo_state.dart';

class HomeInfoBloc extends Bloc<HomeInfoEvent, HomeInfoState> {
  HomeInfoBloc() : super(HomeInfoInitial()) {
    on<CargarHomeInfo>((event, emit) async{
      emit(HomeInfoLoading());

      try {
        final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));

        if (response.statusCode == 200) {
          final decode = jsonDecode(response.body);

          if (decode is List) {
            final users =
                decode
                    .whereType<Map<String, dynamic>>()
                    .map((e) => User.fromJson(e))
                    .take(2)
                    .toList();
            emit(HomeInfoSuccess(users));
          } else {
            print("Error: La respuesta no es una lista");
            emit(HomeInfoFailed());
          }
        } else {
          print("Error: Código de estado ${response.statusCode}");
          emit(HomeInfoFailed());
        }
      } catch (e) {
        print("Error al realizar la petición: $e");
        emit(HomeInfoFailed());
      }
    });

    on<RetryHomeInfo>((event, emit) async{
      emit(HomeInfoLoading());
    });
  }
}