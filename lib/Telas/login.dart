import 'package:flutter/material.dart';
//import 'cadastro_tela.dart';
// import 'home_aplicativo.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter_app/auth.dart';
import 'package:phuel_app/Autenticacao/provider.dart';
import 'package:phuel_app/Autenticacao/validators.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:firebase_ui/login_view.dart';
// import 'package:firebase_ui/password_view.dart';

class Login extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<Login> {
  String _email;
  String _password;
  FormType _formType = FormType.login;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool validate(){
    final form = _formKey.currentState;

    if(form.validate()){
      form.save();
      return true;
    }else{
      return false;
    }
  }

  void submit() async{
    if(validate()){
      try{
        final auth = Provider.of(context).auth;
        if(_formType == FormType.login){
          String userId = await auth.signInWithEmailAndPassword(
            _email, _password,
            );

            print('signed in $userId');
        }else{
          String userId = await auth.signInWithEmailAndPassword(
            _email, _password,
            );

            print('Registar $userId');
        }
      }catch(e){
        print(e);
      }
    }
  }

  void switchFormState(String state){
    _formKey.currentState.reset();
    if(state == 'Registar'){
      setState(() {
        _formType = FormType.register;
      });
    }else{
      setState(() {
        _formType = FormType.login;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        key: _formKey,
        child: Form(
          child: ListView(
            padding: EdgeInsets.all(0.0),
            children: <Widget>[
              _layout(),
              _inputs(),
              //_showCircularProgress(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _layout() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 2.5,
      decoration: BoxDecoration(
          gradient: LinearGradient(
            stops: <double>[0.5, 0.8],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFFFF4100), Color(0xFFFF8c00)],
          ),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(150),
            bottomRight: Radius.circular(150),
          )),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Spacer(),
          Align(
              alignment: Alignment.center,
              child: Icon(
                Icons.ev_station,
                size: 100,
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
                'Phuel',
                style: TextStyle(color: Colors.white, fontSize: 28),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _inputs() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 2,
      key: this._formKey,
      padding: EdgeInsets.only(top: 32),
      child: Column(children: <Widget>[
        _caixadeEmail(),
        _caixadeSenha(),
        _textEsqueceuSenha(),
        _botaoLogin(),
        //_botaoRegistro(),
      ]),
    );
  }

  Widget _caixadeEmail() {
    return Container(
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
          boxShadow: [BoxShadow(color: Colors.black, blurRadius: 10)]),
      child: TextFormField(
        validator: (input) {
          if (input.isEmpty) {
            return 'Digite seu e-mail.';
          }
        },
        decoration: InputDecoration(
            icon: Icon(
              Icons.email,
            ),
            hintText: 'E-mail',
            border: InputBorder.none),
        onSaved: (value) => _email = value,
      ),
    );
  }

  Widget _caixadeSenha() {
    return Container(
      width: MediaQuery.of(context).size.width / 1.3,
      height: 50,
      margin: EdgeInsets.only(top: 32),
      padding: EdgeInsets.only(
        top: 10,
        left: 16,
        right: 4,
        bottom: 4,
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(50)),
          color: Colors.white,
          boxShadow: [BoxShadow(color: Colors.black, blurRadius: 10)]),
      child: TextFormField(
        validator: (input) {
          if (input.length < 6) {
            return 'Sua senha tem que ter 6 caracteres no minimo';
          }
        },
        obscureText: true,
        // keyboardType: TextInputType.text,
        decoration: InputDecoration(
            icon: Icon(
              Icons.vpn_key,
            ),
            hintText: 'Senha',
            border: InputBorder.none),
        onSaved: (value) => _password = value,
      ),
    );
  }

  Widget _textEsqueceuSenha() {
    return Align(
      alignment: Alignment.centerRight,
      child: Padding(
        padding: const EdgeInsets.only(top: 16, right: 42),
        child: Text(
          'Esqueceu a senha?',
        ),
      ),
    );
  }

  Widget _botaoLogin() {
    if (_formType == FormType.login) {
      return Container(
        width: MediaQuery.of(context).size.width / 1.2,
        height: 50,
        margin: EdgeInsets.only(top: 20),
        child: Column(children: <Widget>[
          RaisedButton(
            shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(50.0)),
            child: Text(
              'Entrar',
              style: TextStyle(color: Colors.white),
            ),
            onPressed: submit,
            color: Color(0xFFFF4500),
          ),
          FlatButton(
            child: Text('Registar'),
            onPressed: () {
              switchFormState('Registar');
            },
          ),
          RaisedButton(
            shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(50.0)),
            color: Colors.blue[600],
            child: Text("Entrar com conta Google"),
            onPressed: () async{
              try{
                final _auth = Provider.of(context).auth;
                final id = await _auth.signInWithGoogle();
                print("Entrar com conta google $id");
              }catch(e){
                print(e);
              }
            },
          ),
        ]),
      );
    } else {
      return Container(
        width: MediaQuery.of(context).size.width / 1.2,
        height: 50,
        margin: EdgeInsets.only(top: 20),
        child: Column(children: <Widget>[
          RaisedButton(
            shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(50.0)),
            child: Text(
              'Criar uma conta',
              style: TextStyle(color: Colors.white),
            ),
            onPressed: submit,
            color: Color(0xFFFF4500),
          ),
          FlatButton(
            child: Text('Entrar'),
            onPressed: () {
              switchFormState('login'); 
            },
          )
        ]),
      );
    }
  }

  // Widget _botaoRegistro() {
  //   return Container(
  //     margin: EdgeInsets.only(top: 20.0),
  //     height: 50,
  //     width: MediaQuery.of(context).size.width / 1.2,
  //     child: RaisedButton(
  //       shape: RoundedRectangleBorder(
  //           borderRadius: new BorderRadius.circular(50.0)),
  //       child: Text(
  //         'Registrar',
  //         style: TextStyle(color: Colors.white),
  //       ),
  //       onPressed: () {
  //         Navigator.push(
  //           context,
  //           MaterialPageRoute(builder: (context) => CadastroTela()),
  //         );
  //       },
  //       color: Color(0xFFFF4500),
  //     ),
  //   );
  // }

  // Future<void> validar() async {
  //   final formState = _formKey.currentState;
  //   if (formState.validate()) {
  //     formState.save();
  //     try {
  //       FirebaseUser user = await FirebaseAuth.instance
  //           .signInWithEmailAndPassword(email: _email, password: _password);
  //       Navigator.push(
  //           context, MaterialPageRoute(builder: (context) => HomeAplicativo()));
  //     } catch (e) {
  //       print(e.message);
  //     }
  //   }
  // }
}
