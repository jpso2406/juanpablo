//clase public
class Person {
  String name;
  String age;
  String email;

  // Constructor
  Person({required this.name, required this.age, required this.email});
}
//clases privade
class Car {
  String? _marca;
  String? _modelo;
  String? _ano;

  // Constructor
  Car({required String ano, String? marca, String? modelo})
      : _ano = ano,
        _marca = marca,
        _modelo = modelo;

  // Getters
  String? get marca => _marca;
  String? get modelo => _modelo;
  String get ano => _ano!; 

 //setter
  set marca(String? marca) {
    _marca = marca;
  }

  set modelo(String? modelo) {
    _modelo = modelo;
  }

  set ano(String? ano) {
    _ano = ano;
  }
  //metodo para mostrar info
  void mostrarInfo() {
    print("Marca: $_marca, Modelo: $_modelo, Año: $_ano");
  }
}

void main() {

  Person juan= Person(name: 'Juan', age: '19', email: "juanpablo@gmail.com");
  print(juan.name); 
  print(juan.age);
  print(juan.email);
  
  Car car = Car(ano: '2022', marca: 'Toyota', modelo: 'Corolla');

  
  car.mostrarInfo();
}