import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class User {
  int? id;
  String? name;
  String? username;
  String? email;
  String? phone;
  String? website;
  Address? address;
  Company? company;

  User(Map<String, dynamic> map) {
    id = map['id'];
    name = map['name'];
    username = map['username'];
    email = map['email'];
    phone = map['phone'];
    website = map['website'];

    address = Address(map['address']);
    company = Company(map['company']);
  }
}

class Address {
  String? street;
  String? suite;
  String? city;
  String? zipcode;
  Geo? geo;

  Address(Map map) {
    street = map['street'];
    suite = map['suite'];
    city = map['city'];
    zipcode = map['zipcode'];

    geo = Geo(map['geo']);
  }
}

class Company {
  String? name;
  String? catchPhrase;
  String? bs;

  Company(Map map) {
    name = map['name'];
    catchPhrase = map['catchPhrase'];
    bs = map['bs'];
  }
}

class Geo {
  String? lat;
  String? lng;

  Geo(Map map) {
    lat = map['lat'];
    lng = map['lng'];
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SENA',
      home: FutureBuilderExample(),
    );
  }
}

class FutureBuilderExample extends StatelessWidget {
  Future<User> fetchData() async {
    // Simula una espera de 3 segundos
    await Future.delayed(Duration(seconds: 5));

    // Realiza la petición a la API en este caso gratuita
    var url = Uri.https('jsonplaceholder.typicode.com', 'users/2');
    var response = await http.get(url);

    if (response.statusCode == 200) {
      return User(jsonDecode(response.body));
    } else {  
      throw Exception('Failed to load user');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FutureBuilder Ejercicio SENA'),
      ),
      body: Center(
        child: FutureBuilder<User>(
          future: fetchData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              // Muestra el indicador de carga mientras se espera
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              // Muestra un mensaje de error si algo falla
              return Text('Error: ${snapshot.error}');
            } else {
              // Si el Future se completó, mostramos los datos
              User user = snapshot.data!;
              return Text(
                'ID: ${user.id} \n'
                'Name: ${user.name} \n'
                'Username: ${user.username} \n'
                'Email: ${user.email} \n'
                'Address: \n'
                '  Street: ${user.address!.street!} \n'
                '  Suite: ${user.address!.suite} \n'
                '  City: ${user.address!.city} \n'
                '  ZipCode: ${user.address!.zipcode} \n'
                'Geo: \n'
                '  Lat: ${user.address!.geo!.lat} \n'
                '  Lng: ${user.address!.geo!.lng} \n'
                'Phone: ${user.phone} \n'
                'Website: ${user.website} \n'
                'Company: \n'
                '  Name: ${user.company!.name} \n'
                '  CatchPhrase: ${user.company!.catchPhrase} \n'
                '  Bs: ${user.company!.bs}'
              );

            }
          },
        ),
      ),
    );
  }
}