import 'dart:io';

void main(){
  print('');
  print('Selecciona tipo de Entrega');
  print('');
  print('0 = Terrestre');
  print('1 = Maritima');
  print('2 = Aerea');
  print('');
  print('--------------------');
  print('');

  int tipe = int.parse(stdin.readLineSync()!);

  print('');
  Logistics log;

  if (tipe == 1){
    log = SeaLogistics();

  } else if (tipe == 0){
    log = RoadLogistics();

  } else if (tipe == 2){
    log = AirLogistics();

  } else {
    print('Ha Ocurrido Un Error 🛑');
    print('');
    exit(1);
  }

  log.planDelivery();
  print('');
}


abstract class Trasnport {
  void deliver();
}

class Truck extends Trasnport {
  @override
  void deliver() {
    print('Entrega por tierra en una caja');
  }
}

class Ship extends Trasnport {
  @override
  void deliver(){
    print('Entrega por mar en un contenedor');
  }
}

class Plane extends Trasnport {
  @override
  void deliver() {
    print('Entrega aerea en un caja');
  }
  
}


abstract class Logistics {
  void planDelivery(){
    Trasnport t = createTransport();
    return t.deliver();
  }

  Trasnport createTransport();
}

class SeaLogistics extends Logistics {
  @override
  Trasnport createTransport() {
    return Ship();
  }

}

class RoadLogistics extends Logistics{
  @override
  Trasnport createTransport() {
    return Truck();
  }

}

class AirLogistics extends Logistics{
  @override
  Trasnport createTransport() {
    return Plane();
  }

}