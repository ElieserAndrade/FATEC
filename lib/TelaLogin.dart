import 'package:flutter/material.dart';
import 'package:repositorio/CadastraTraballho.dart';
import 'package:repositorio/repo.dart';

class TelaLogin extends StatelessWidget {
  final int senha;
  final String login;

  const TelaLogin({Key key, this.senha, this.login}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Login",
            // widget.curso, // Ah to ligado, tem no banco o curso? ainda nao
            style: TextStyle(fontFamily: 'ChewyRegular', fontSize: 30),
          ),
          centerTitle: true,
          backgroundColor: Color(0xFFC75555),

          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            tooltip: 'Voltar',
            onPressed: () {
              Navigator.pop(context);
              //createAlertDialog(context);
            },
          ), //IconButton
        ),
        body: FutureBuilder(
          future: getRepo(),
          builder: (context, snapshot) {
            return _body(context);
          },
        ));
  }
}

_body(BuildContext context) {
  return Form(
      child: ListView(
    children: <Widget>[
      textFormFieldLogin(),
      textFormFieldSenha(),
      containerButton(context)
    ],
  ));
}

textFormFieldLogin() {
  return TextFormField(
      keyboardType: TextInputType.text,
      style: TextStyle(color: Colors.black),
      decoration: InputDecoration(
          labelText: "Login",
          labelStyle: TextStyle(
              fontFamily: 'ChewyRegular', fontSize: 20.0, color: Colors.black),
          hintText: "Informe o login"));
}

textFormFieldSenha() {
  return TextFormField(
      obscureText: true,
      keyboardType: TextInputType.text,
      style: TextStyle(color: Colors.black),
      decoration: InputDecoration(
          labelText: "Senha",
          labelStyle: TextStyle(
              fontFamily: 'ChewyRegular', fontSize: 20.0, color: Colors.black),
          hintText: "Informe a senha"));
}

containerButton(BuildContext context) {
  Color cor = Color(0xFFC75555);
  return Container(
    height: 40.0,
    margin: EdgeInsets.only(top: 10.0),
    child: RaisedButton(
      color: cor,
      child: Text("Login",
          style: TextStyle(
              fontFamily: 'ChewyRegular', color: Colors.white, fontSize: 20.0)),
      onPressed: () {
        _onClickLogin(context);
      },
    ),
  );
}

_onClickLogin(BuildContext context) {
  var login = "adm";
  var senha = "adm";
  Color cor = Color(0xFFC75555);
  if (login == "adm" || senha == "adm") {
    showDialog(
      context: context,
      builder: (context) {
        Color cor = Color(0xFFC75555);
        return AlertDialog(
            title: Text("Avante"),
            content: Text("Login Efetuado com sucesso"),
            actions: <Widget>[
              FlatButton(
                  child: Text(
                    "OK",
                    style: TextStyle(color: Color(0xFFC75555)),
                  ),
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => (CadProj())),
                    );
                  })
            ]);
      },
    );
  } else {
    showDialog(
      context: context,
      builder: (context) {
        Color cor = Color(0xFFC75555);
        return AlertDialog(
            title: Text("Erro"),
            content: Text("Login e/ou Senha inválido(s)"),
            actions: <Widget>[
              FlatButton(
                  child: Text(
                    "OK",
                    style: TextStyle(color: Color(0xFFC75555)),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  })
            ]);
      },
    );
  }
}
