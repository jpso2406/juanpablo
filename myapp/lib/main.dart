import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() => runApp(Homes());

Future<Map<String,dynamic>> mapeo(String id) async {
  
  var url = Uri.http('jsonplaceholder.typicode.com', 'users/$id');
  var response = await http.get(url);
  Map<String, dynamic> map = jsonDecode(response.body); 
  return map;

}

// ignore: must_be_immutable
class Homes extends StatelessWidget{
  
  final ids = TextEditingController();

  String id = '';
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Home',
      home: Scaffold(
        appBar: AppBar(
          title: Center( child: Text('Welcome')),
          backgroundColor: Colors.indigo,
          foregroundColor: Colors.white,
        ),
        body:Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,  
            children: [
              Text('Introduce numero de ID de 1 a 10'),
              Text(''),

              SizedBox (
                width: 50, 
                child: TextField(
                  
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'ID',

                  ),
                  textAlign: TextAlign.center,
                  controller: ids,
                ),
              ),
              Text(''),
              Text(''),
              Builder(
                builder: (context) => FloatingActionButton(
                  backgroundColor: Colors.indigo[100],
                  onPressed: () {
                    id = ids.text;
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => MyApp(id: id)),
                      (Route<dynamic> route) => false,
                    );
                  },
                  child: Icon(Icons.search, size: 25,color: Colors.white,),
                ),
              ),
              Text(''),
            ],),),
      ),
    );
  }

}


class MyApp extends StatelessWidget{
  
  final String id;

  MyApp({required this.id});

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
          future: mapeo(id), 
          builder: (context, snapshot){
            if (snapshot.hasData) {

              Users usuario = Users(snapshot.data as Map);
              return Home(usuario: usuario);
            } 
            else {
              
              return  Loading();
            }
          },
        )
      )
    );
  }
}

class Loading extends StatelessWidget {
  const Loading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(child: Column(mainAxisAlignment: MainAxisAlignment.center,
    children: [
      CircularProgressIndicator(),
      Text(''),
      Text(''),
      Text(''),
      Text(''),
      
      Builder(
      builder: (context) => ElevatedButton(
        onPressed: () {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => Homes()),
            (Route<dynamic> route) => false,
          );
        },
                    
        style: ElevatedButton.styleFrom(  
            shape: RoundedRectangleBorder(  
            borderRadius: BorderRadius.circular(10),  
          ),  
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),  
        ),
        
        child: Text('Regresar', style: TextStyle(color: Colors.black, fontSize: 16),),
      ),
    ),
      ],),);
  }
}

class Home extends StatelessWidget {
  const Home({
    super.key,
    required this.usuario
  });

  final Users usuario;

  @override
  Widget build(BuildContext context) {
    return Center(        
      child: Column(mainAxisAlignment: MainAxisAlignment.center,
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
          Builder(
            builder: (context, ) => ElevatedButton(
            onPressed: () {
                      
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => Homes()),
                (Route<dynamic> route) => false,
              );
            },
                              
            style: ElevatedButton.styleFrom(  
                shape: RoundedRectangleBorder(  
                borderRadius: BorderRadius.circular(10),  
              ),  
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),  
            ),
                  
            child: Text('Regresar', style: TextStyle(color: Colors.black, fontSize: 16),),
            )
          ),   
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
  Company?  company;
  Address? address;

  Users(Map m){
    
    this.id =  m['id'];
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

class Company{
  String? name;
  String? catchPhrase;
  String? bs;

  Company(Map m){
        
    this.bs = m['bs'];
    this.catchPhrase = m['catchPhrase'];
    this.name = m['name'];
    

  }
}

class Address{
  String? street;
  String? suite;
  String? city;
  String? zipcode;
  Geo?  geo;

  Address(Map m){
    
    this.street = m['street'];
    this.suite = m['suite'];
    this.city = m['city'];
    this.zipcode = m['zipcode'];
    Geo geo =  Geo(m['geo']);
    this.geo = geo;
  }

}

class Geo{
  String? lat;
  String? lng;

  Geo(Map m){
        
    this.lat = m['lat'];
    this.lng = m['lng'];
  }
}