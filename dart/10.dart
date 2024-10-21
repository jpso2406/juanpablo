class Car {
  String? marca = "TOYOTA";
  int placa = 123456;
  String? modelo = "COROLLA";

  Car() {
    print("Carro criado");
  }
}

void main() {
  Car car = Car();
  print(car);
}
