import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../nuevo/inicio/bloc/iniciodeinfo_bloc.dart';
import '../nuevo/inicio/inicioinfo.dart';



class HomeView extends StatelessWidget {
  final String nombre;
  const HomeView({super.key, required this.nombre});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: EdgeInsetsGeometry.symmetric(horizontal: 20, vertical: 10),
            child: Image.asset('assets/carro.png',width: double.infinity,height: 250,fit: BoxFit.cover,),
          ),
          Text('Bienvenido $nombre', style: TextStyle(fontSize: 24),),
          SizedBox(height: 30),
          BlocProvider(
            create: (context) => HomeInfoBloc()..add(CargarHomeInfo()),
            child: HomeinfoContainer(nombre: nombre),
          ),
        ],
      ),
    );
  }
}