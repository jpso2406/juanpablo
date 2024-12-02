import 'dart:io';

class Colaborador{
  String? _nombreCompleto;
  int? _tipoColaborador;
  double _aporte = 0;

  Colaborador(String n, int t, double a) {
    this._nombreCompleto = n;
    this._tipoColaborador = t;
    this._aporte = a;

  }

  String getNombreCompleto(){
    return this._nombreCompleto!;
  }

  int getTipoColaborador(){
    return this._tipoColaborador!;
  }

  double getAporte(){
    return this._aporte;
  }

  @override
  String toString() { 
    return '{"nombre": $_nombreCompleto, "tipo": $_tipoColaborador, "aporte": $_aporte}';
  }

}



class Recolecta {
  List<Colaborador> _colaboradores = [];
  double? _montoRecaudar;
  double _balance = 0;

  Recolecta(double m, double b){
    this._montoRecaudar = m;
    this._balance = b;
  }


  void addColaborador(Colaborador c){
    _colaboradores.add(c);
    _balance = _balance + c.getAporte();
  }

  bool finalizada(){
    if (_balance >= _montoRecaudar!) {
      return true;
    } else {
      return false;
    }
  }

  List<Colaborador> generosos(){
    List<Colaborador> generosos = [];
    for (var i = 0; i < _colaboradores.length; i++) {
      if (_colaboradores[i].getAporte() >= 10000){
        generosos.add(_colaboradores[i]);
      }
    }
    return generosos;
  }

  double recaudoGenerosos(){
    double recaudo = 0;
    for (var i = 0; i < generosos().length; i++) {
      recaudo = recaudo + generosos()[i].getAporte();
    }
    return recaudo;
  }

  double promedioGenerosos() => recaudoGenerosos() / generosos().length;

  double recaudoPorTipo(int tipo){
    double recaudoTipo1 = 0;
    double recaudoTipo2 = 0; 
    
    for (var i = 0; i < _colaboradores.length; i++) { 
      
      if (_colaboradores[i]._tipoColaborador == 1) {
        
        recaudoTipo1 = recaudoTipo1 + _colaboradores[i].getAporte();

      } else {
        
        recaudoTipo2 = recaudoTipo2 + _colaboradores[i].getAporte();

      }
    }
    
    if (tipo == 1) {

      return recaudoTipo1;

    } else {

      return recaudoTipo2;

    }

  }


}


void main(){

  print("Ingresa monto a recaudar:");
  double monto = double.parse(stdin.readLineSync()!);

  Recolecta r = Recolecta(monto, 0);

  print("Monto a recaudar \$${monto}");

  print("---------------------------");
  

  while (!r.finalizada()) {
    
    print("ingresa nombre:");
    String nombre = stdin.readLineSync()!;
    
    print("ingresa aporte:");
    double aporte = double.parse(stdin.readLineSync()!);
    
    print("ingresa tipo de colaborador (1 o 2):");
    int tipo = int.parse(stdin.readLineSync()!);

    Colaborador c = Colaborador(nombre, tipo, aporte);

    print("---------------------------");

    r.addColaborador(c);

    // print(r.finalizada());

  }

  print ("El recaudo de los generosos es = \$${r.recaudoGenerosos()}");
  print ("El promedio de los generosos es = \$${r.promedioGenerosos()}");
  print ("El recaudo de los colaboradores tipo 1 = \$${r.recaudoPorTipo(1)}");
  print ("El recaudo de los colaboradores tipo 2 = \$${r.recaudoPorTipo(2)}");

  // print(r._colaboradores);
}