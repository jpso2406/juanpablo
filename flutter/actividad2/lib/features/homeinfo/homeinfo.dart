import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/home_info_bloc.dart';
import 'widgets/faild.dart';
import 'widgets/loidng.dart'; 
import 'widgets/success.dart';

class HomeinfoContainer extends StatelessWidget {
  final String nombre;
  const HomeinfoContainer({super.key, required this.nombre});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeInfoBloc, HomeInfoState>(
      builder: (context, state) {
        if (state is HomeInfoLoading) {
          return LoadingWidget();
        } if (state is HomeInfoFailed) {
          return FailedWidget();
        } if (state is HomeInfoSuccess) {
          return Expanded(child: SuccessWidget(users: state.users));
        }
        
        return Text('Bienvenido $nombre');
      },
    );
  }
}