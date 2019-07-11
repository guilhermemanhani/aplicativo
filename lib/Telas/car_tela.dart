import 'package:flutter/material.dart';
import 'home_aplicativo.dart';

class CarTela extends StatefulWidget{
  const CarTela();
  @override
  _CarTela createState() => _CarTela();
}
class _CarTela extends State<CarTela>{
  Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: new Text('Car'),
          backgroundColor: Color(0xFFFF4100),
        ),
        body: Image.network(
          'https://picsum.photos/250?image=9',
        ),
    );
  }
}