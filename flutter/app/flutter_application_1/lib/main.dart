import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(MyApp());
}

Future<Map<String, dynamic>> mapeo() async {
  var url = Uri.http('jsonplaceholder.typicode.com', 'users/2');
  var response = await http.get(url);
  Map<String, dynamic> map = jsonDecode(response.body);
  return map;
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'App Json',
        home: Scaffold(
            appBar: AppBar(
              title: Text('App Json'),
              backgroundColor: Colors.deepPurple,
              foregroundColor: Colors.white,
            ),
            body: FutureBuilder(
              future: mapeo(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  Users usuario = Users(snapshot.data as Map);
                  return Home(usuario: usuario);
                } else {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [CircularProgressIndicator()],
                    ),
                  );
                }
              },
            )));
  }
}

class Home extends StatelessWidget {
  const Home({super.key, required this.usuario});

  final Users usuario;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(''),
          Text('- Usuario -'),
          Text('Id : ${usuario.id}'),
          Text('name: ${usuario.name}'),
          Text('username: ${usuario.username}'),
          Text('email: ${usuario.email}'),
          Text('phone: ${usuario.phone}'),
          Text('website: ${usuario.website}'),
          Text(''),
          Text('- Empresa -'),
          Text('nombre: ${usuario.company?.name}'),
          Text('bs: ${usuario.company?.bs}'),
          Text('catchPhrase: ${usuario.company?.catchPhrase}'),
          Text(''),
          Text('- Dirección -'),
          Text('street: ${usuario.address?.street}'),
          Text('suite: ${usuario.address?.suite}'),
          Text('city: ${usuario.address?.city}'),
          Text('zipcode: ${usuario.address?.zipcode}'),
          Text(''),
          Text('- Geo -'),
          Text('lat: ${usuario.address?.geo?.lat}'),
          Text('lng: ${usuario.address?.geo?.lng}'),
          Text(''),
          Text(''),
        ],
      ),
    );
  }
}

class Users {
  int? id;
  String? name;
  String? username;
  String? email;
  String? phone;
  String? website;
  Company? company;
  Address? address;

  Users(Map m) {
    this.id = m['id'];
    this.name = m['name'];
    this.username = m['username'];
    this.email = m['email'];
    this.phone = m['phone'];
    this.website = m['website'];

    Company company = Company(m['company']);
    this.company = company;

    Address address = Address(m['address']);
    this.address = address;
  }
}

class Company {
  String? name;
  String? catchPhrase;
  String? bs;

  Company(Map m) {
    this.bs = m['bs'];
    this.catchPhrase = m['catchPhrase'];
    this.name = m['name'];
  }
}

class Address {
  String? street;
  String? suite;
  String? city;
  String? zipcode;
  Geo? geo;

  Address(Map m) {
    this.street = m['street'];
    this.suite = m['suite'];
    this.city = m['city'];
    this.zipcode = m['zipcode'];

    Geo geo = Geo(m['geo']);
    this.geo = geo;
  }
}

class Geo {
  String? lat;
  String? lng;

  Geo(Map m) {
    this.lat = m['lat'];
    this.lng = m['lng'];
  }
}
