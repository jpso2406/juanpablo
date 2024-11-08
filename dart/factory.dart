import 'dart:io';

void main(){
  
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

