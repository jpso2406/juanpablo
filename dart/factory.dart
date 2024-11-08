import 'dart:io';

void main(){

  int opcion = 0;
  print('Seleccione el tipo de transporte: 1. Terrestre 2. Maritimo');
  print("-------------");
  opcion = int.parse(stdin.readLineSync()!);
  print("-------------");
  opcion == 1 ? LogisticaTerrestre().planEntrega() : LogisticaMaritima().planEntrega();

}

  void entrega(){
    print('Entrega por tierra en una caja');
  }

  void entregamar(){
    print('Entrega por mar en un contenedor');
  }




abstract class transporte{
  void entrega();
}

class camion extends transporte{
  @override
  void entrega(){
    print('Entrega por tierra en una caja');
  }
}

class barco extends transporte{
  @override
  void entrega(){
    print('Entrega por mar en un contenedor');
  }
}


abstract class logistica{
  void planEntrega(){
    transporte t = crearTransporte();
    return t.entrega();
  }
  transporte crearTransporte();
}

class LogisticaMaritima extends logistica{
  @override
  transporte crearTransporte() {
    return barco();
  }
}

class LogisticaTerrestre extends logistica{
  @override
  transporte crearTransporte() {
    return camion();
  }
}

