import 'dart:io';

void main() {
  print("escriber tu nombre");
  print("escriber tu edad");
  int e = int.parse(stdin.readLineSync()!);
  double promedio = ( e/ 2);
  print(promedio);
  bool menordeedad  = e < 18;
  if(menordeedad){
    print("eres menor de edad");
  }else
    print("eres mayor de edad");
  }

  

