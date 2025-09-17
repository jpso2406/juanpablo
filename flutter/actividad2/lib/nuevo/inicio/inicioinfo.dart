import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/iniciodeinfo_bloc.dart';
import 'widgets/faild.dart';
import 'widgets/loidng.dart';
import 'widgets/success.dart';

class HomeinfoContainer extends StatelessWidget {
  final String nombre;
  const HomeinfoContainer({super.key, required this.nombre});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Información del Usuario"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: BlocBuilder<HomeInfoBloc, HomeInfoState>(
          builder: (context, state) {
            if (state is HomeInfoLoading) {
              return const LoadingWidget();
            } else if (state is HomeInfoFailed) {
              return const FailedWidget();
            } else if (state is HomeInfoSuccess) {
              return SuccessWidget(users: state.users);
            } else {
              return Center(
                child: Text(
                  'Bienvenido $nombre',
                  style: const TextStyle(fontSize: 18),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}