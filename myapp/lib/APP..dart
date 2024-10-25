import 'package:flutter/material.dart';

void mian(){
  runApp(MyApp());
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
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
   return MaterialApp(
    title: ,
   )
  }

}