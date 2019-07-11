import 'package:flutter/material.dart';
import 'login.dart';

class CadastroTela extends StatefulWidget {
  const CadastroTela();
  @override
  _CadastroTela createState() => _CadastroTela();
}

class _CadastroTela extends State<CadastroTela> {

  final myControllerCPF = TextEditingController();
  final myControllerSenha = TextEditingController();
  final myControllerNome = TextEditingController();
  final myControllerSobrenome = TextEditingController();
  final myControllerEmail = TextEditingController();
  final myControllerCelPhone = TextEditingController();
  final double margem = 20;

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myControllerNome.dispose();
    myControllerSobrenome.dispose();
    myControllerCPF.dispose();
    myControllerSenha.dispose();
    myControllerEmail.dispose();
    myControllerCelPhone.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView(
          scrollDirection: Axis.vertical,
          padding: EdgeInsets.all(0.0),
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height *0.35,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xFFFF8c00),
                      Color(0xFFFF4100),
                    ],
                  ),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(110),
                      bottomRight: Radius.circular(110))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Spacer(),
                  Align(
                      alignment: Alignment.center,
                      child: Icon(
                        Icons.person,
                        size: 90,
                        color: Colors.white,
                      )),
                  Spacer(),
                  Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.only(
                        bottom: 20,
                      ),
                      child: Text(
                        'Cadastro',
                        style: TextStyle(color: Colors.white, fontSize: 28),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.65,
              padding: EdgeInsets.only(top: 32),
              child: Column(
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width / 1.3,
                    height: 50,
                    padding: EdgeInsets.only(
                      top: 10,
                      left: 16,
                      right: 4,
                      bottom: 4,
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(color: Colors.black, blurRadius: 10)
                        ]),
                    child: TextField(
                      controller: myControllerEmail,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          icon: Icon(
                            Icons.email,
                          ),
                          hintText: 'E-mail',
                          border: InputBorder.none),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: margem),
                    width: MediaQuery.of(context).size.width / 1.3,
                    height: 50,
                    padding: EdgeInsets.only(
                      top: 10,
                      left: 16,
                      right: 4,
                      bottom: 4,
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(color: Colors.black, blurRadius: 10)
                        ]),
                    child: TextField(
                      controller: myControllerCPF,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          icon: Icon(
                            Icons.perm_identity,
                          ),
                          hintText: 'CPF',
                          border: InputBorder.none),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: margem),
                    width: MediaQuery.of(context).size.width / 1.3,
                    height: 50,
                    padding: EdgeInsets.only(
                      top: 10,
                      left: 16,
                      right: 4,
                      bottom: 4,
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(color: Colors.black, blurRadius: 10)
                        ]),
                    child: TextField(
                      controller: myControllerSenha,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          icon: Icon(
                            Icons.vpn_key,
                          ),
                          hintText: 'Senha',
                          border: InputBorder.none),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: margem),
                    width: MediaQuery.of(context).size.width / 1.3,
                    height: 50,
                    padding: EdgeInsets.only(
                      top: 10,
                      left: 16,
                      right: 4,
                      bottom: 4,
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(color: Colors.black, blurRadius: 10)
                        ]),
                    child: TextField(
                      controller: myControllerCelPhone,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                          icon: Icon(
                            Icons.phone_android,
                          ),
                          hintText: 'Telefone',
                          border: InputBorder.none),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: margem),
                    width: MediaQuery.of(context).size.width / 1.3,
                    height: 50,
                    padding: EdgeInsets.only(
                      top: 10,
                      left: 16,
                      right: 4,
                      bottom: 4,
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(color: Colors.black, blurRadius: 10)
                        ]),
                    child: TextField(
                      controller: myControllerNome,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          icon: Icon(
                            Icons.text_fields,
                          ),
                          hintText: 'Nome',
                          border: InputBorder.none),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: margem),
                    height: 50,
                    width: MediaQuery.of(context).size.width / 1.3,
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(50.0)),
                      child: Text(
                        'Registrar',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {
                        if (myControllerSenha.text == '' || myControllerEmail.text == '') {
                          return showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                // Retrieve the text the that user has entered by using the
                                // TextEditingController.
                                content:
                                Text('Campo E-mail ou Senha está vazio!'),
                              );
                            },
                          );
                        } else {
                          Navigator.pop(
                            context,
                            MaterialPageRoute(builder: (context) => Login()),
                          );
                        }
                      },
                      color: Color(0xFFFF4500),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}