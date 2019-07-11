import 'package:flutter/material.dart';
import 'package:phuel_app/Telas/home_aplicativo.dart';
import 'package:phuel_app/Telas/login.dart';
import 'package:phuel_app/Autenticacao/auth.dart';
import 'package:phuel_app/Autenticacao/provider.dart';
//import 'package:flutter_app/validators.dart';
//import 'cadastro_tela.dart';
//import 'package:firebase_auth/firebase_auth.dart';

void main() {
  runApp(UnitConverterApp());
}

class UnitConverterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      auth: Auth(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'App Energy',
        theme: ThemeData(
          textTheme: Theme.of(context).textTheme.apply(
                bodyColor: Colors.grey,
                displayColor: Colors.black,
              ),
        ),
        home: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    final Auth auth = Provider.of(context).auth;
    return StreamBuilder<String>(
      stream: auth.onAuthStateChanged,
      builder: (context, AsyncSnapshot<String> snapshot){
        if(snapshot.connectionState == ConnectionState.active){
          final bool loggedIn = snapshot.hasData;
          return loggedIn ? HomeAplicativo() : Login();
        }
        return CircularProgressIndicator();
      },
    );
  }
}
