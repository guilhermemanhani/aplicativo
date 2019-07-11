import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'home_aplicativo.dart';

class PerfilTela extends StatefulWidget {
  @override
  _PerfilTela createState() => _PerfilTela();
}

class _PerfilTela extends State<PerfilTela> {
  bool switchValue1 = false;
  bool switchValue2 = false;
  bool switchValue3 = false;
  double _value = 25.0;
  double _discreteValue = 20.0;
  @override
  Widget build(BuildContext context) {
    final TextStyle estilobonito = new TextStyle(
      color: Colors.black,
      fontSize: 20.0,
    );
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Perfil'),
        backgroundColor: Color(0xFFFF4100),
      ),
      //drawer: Text('teste'),
      body: new Container(
        child: ListView(
          children: <Widget>[
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            child: Text('Valor irrelevante:', style: estilobonito),
                          ),
                        ),
                        CupertinoSwitch(
                            value: switchValue1,
                            onChanged: (value) {
                              setState(() => switchValue1 = value);
                            }),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            child: Text('Carga 30%:', style: estilobonito),
                          ),
                        ),
                        CupertinoSwitch(
                            value: switchValue2,
                            onChanged: (value) {
                              setState(() => switchValue2 = value);
                            }),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            child: Text('Carga 50%:', style: estilobonito),
                          ),
                        ),
                        CupertinoSwitch(
                            value: switchValue3,
                            onChanged: (value) {
                              setState(() => switchValue3 = value);
                            }),
                      ],
                    ),
                    Row(
                      children: [
                        CupertinoSlider(
                          value: _discreteValue,
                          min: 0.0,
                          max: 100.0,
                          divisions: 10,
                          onChanged: (double value) {
                            setState(() {
                              _discreteValue = value;
                            });
                          },
                        ),
                        Text('Slide valor: $_discreteValue'),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
