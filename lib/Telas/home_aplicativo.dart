import 'package:flutter/material.dart';
//import 'login.dart';
import 'car_tela.dart';
import 'perfil_tela.dart';
import 'package:phuel_app/Autenticacao/auth.dart';
import 'package:phuel_app/Autenticacao/provider.dart';

class HomeAplicativo extends StatefulWidget {
  const HomeAplicativo();
  @override
  HomePage createState() => HomePage();
}

class HomePage extends State<HomeAplicativo> {
  Choice selectedChoice = choices[0]; // The app's "state".
  int selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Center(
      child: Text(
        'Index 0',
        style: optionStyle,
      ),
    ),
    Text(
      'Index 1',
      style: optionStyle,
    ),
    Text(
      'Index 2',
      style: optionStyle,
    ),
    Text(
      'Index 3,',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  void _select(Choice choice) {
    // Causes the app to rebuild with the new _selectedChoice.
    setState(() {
      selectedChoice = choice;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Phuel'),
          backgroundColor: Color(0xFFFF4100),
          actions: <Widget>[
            FlatButton(
              child: Text("Sair"),
              onPressed: () async{
                try{
                  Auth auth = Provider.of(context).auth;
                  await auth.signOut();
                } catch(e){
                  print(e);
                }
              },
            ),
            // action button
            IconButton(
              icon: Icon(choices[0].icon),
              onPressed: () {
                _select(choices[0]);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CarTela()),
                );
              },
            ),
            // action button
            IconButton(
              icon: Icon(choices[1].icon),
              onPressed: () {
                _select(choices[1]);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PerfilTela()),
                );
              },
            ),
            // overflow menu
//            PopupMenuButton<Choice>(
//              onSelected: _select,
//              itemBuilder: (BuildContext context) {
//                return choices.skip(0).map((Choice choice) {   Botao de menu na lateral
//                  return PopupMenuItem<Choice>(
//                    value: choice,
//                    child: Text(choice.title),
//                  );
//                }).toList();
//              },
//            ),
          ],
        ),
        body: Center(
          //Padding
          child: _widgetOptions.elementAt(selectedIndex),
//          padding: const EdgeInsets.all(16.0),
//          child: ChoiceCard(choice: _selectedChoice),
          //child: _widgetOptions.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.grey[400],
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text('Home'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.ev_station),
              title: Text('Posto'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.battery_unknown),
              title: Text('Bateria'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_balance),
              title: Text('Conta'),
            ),
          ],
          currentIndex: selectedIndex,
          selectedItemColor: Colors.amber[900],
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}

class Choice {
  const Choice({this.title, this.icon});

  final String title;
  final IconData icon;
}

const List<Choice> choices = const <Choice>[
  const Choice(title: 'Car', icon: Icons.directions_car),
  const Choice(title: 'Perfil', icon: Icons.account_circle),
];
