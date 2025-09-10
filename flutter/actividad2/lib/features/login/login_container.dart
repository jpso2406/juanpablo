import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/login_bloc.dart';
import 'widgets/failed_widget.dart';
import 'widgets/initial_widget.dart';
import 'widgets/loading_widget.dart';


import '../../views/home.dart';

class LoginContainer extends StatelessWidget {
  const LoginContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginBloc, LoginState>(

      listener: (context, state) {
        if (state is LoginSuccess) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (_) => HomeView(nombre: state.nombre,))
          );
        }
      },

      builder: (context, state) {
        if (state is LoginInitial) {
          return InitialWidget();
        } else if (state is LoginLoading) {
          return Center(child: LoadingWidget());
        } else if (state is LoginFailed) {
          return Center(child: FailedWidget());
        } else {
          return SizedBox.shrink();
        }
      },
    );
  }
}