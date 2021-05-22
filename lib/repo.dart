import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:repositorio/ajuda.dart';

import 'package:repositorio/estagios.dart';
import 'package:repositorio/grade.dart';
import 'package:repositorio/main.dart';
import 'package:repositorio/trabalhos.dart';

import 'TelaLogin.dart';
//import 'models/api.dart';
//
//import 'package:http/http.dart' as http;

//import 'package:cloud_firestore/cloud_firestore.dart';

class RepoPage extends StatelessWidget {
  createAlertDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("EM BREVE"),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    const color = Color(0xFFC75555);
    return Scaffold(
      backgroundColor: Color(0xFFffffff),
      appBar: AppBar(
        title: Text(
          "REPOSITÓRIO",
          style: TextStyle(fontFamily: 'ChewyRegular', fontSize: 30),
        ),
        centerTitle: true,
        backgroundColor: Color(0xFFC75555),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.account_circle_outlined),
            tooltip: 'Perfil',
            onPressed: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => (TelaLogin()),
                  ));
            },
          ),
        ],
      ),
      drawer: new Drawer(
          child: ListView(
        children: <Widget>[
          new UserAccountsDrawerHeader(
            decoration: BoxDecoration(color: Color(0xFFC75555)),
            currentAccountPicture: new CircleAvatar(
              backgroundImage: new NetworkImage(
                  "https://icon-library.com/images/user-icon-image/user-icon-image-24.jpg"),
            ),
            accountName: new Text("Nome"),
            accountEmail: new Text("Email"),
          ),
          ListTile(
            leading: Icon(
              Icons.message_outlined,
            ),
            title: Text(
              "Mural",
              style: TextStyle(color: Colors.grey[600]),
            ),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (BuildContext context) => (Home())),
              );
              //createAlertDialog(context);
            },
          ),
          ListTile(
            leading: Icon(
              Icons.archive_outlined,
            ),
            title: Text(
              "Repositório",
              style: TextStyle(color: Colors.grey[600]),
            ),
            onTap: null,
            //createAlertDialog(context);
          ),
          ListTile(
            leading: Icon(Icons.calendar_today_outlined),
            title: Text(
              "Calendário",
              style: TextStyle(color: Colors.grey[600]),
            ),
            onTap: null,
          ),
          ListTile(
            leading: Icon(Icons.grid_on_outlined),
            title: Text(
              "Grade do Curso",
              style: TextStyle(color: Colors.grey[600]),
            ),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (BuildContext context) => (Grade())),
              );
              //createAlertDialog(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.group_outlined),
            title: Text(
              "Monitoria",
              style: TextStyle(color: Colors.grey[600]),
            ),
            onTap: () {
              createAlertDialog(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.work_outline),
            title: Text(
              "Central de Estágios",
              style: TextStyle(color: Colors.grey[600]),
            ),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => (Estagios())),
              );
              //createAlertDialog(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.help_outline),
            title: Text(
              "Informações e Ajuda",
              style: TextStyle(color: Colors.grey[600]),
            ),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (BuildContext context) => (Ajuda())),
              );
            },
          ),
        ],
      )),
      body: FutureBuilder(
        future: getRepo(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Container(
                      width: 400,
                      child: Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              cursorColor: color,
                              decoration: InputDecoration(
                                labelText: "Faça uma pesquisa",
                                labelStyle: TextStyle(color: color),
                                fillColor: color,
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25.0),
                                  borderSide: BorderSide(
                                    color: color,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25.0),
                                  borderSide: BorderSide(
                                    color: color,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () => print('clicado'),
                            child: Text('Pesquisar'),
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.resolveWith<Color>(
                                (Set<MaterialState> states) {
                                  return color; // Use the component's default.
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: GridView.count(
                      crossAxisCount: 2,
                      children: List.generate(
                        snapshot.data.length,
                        (index) {
                          return Center(
                            child: Container(
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                    color: Colors.black,
                                    width: 0.09,
                                  ),
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                child: InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            (TrabalhosPage(
                                          trabalhoID: index,
                                          curso: snapshot.data[index]['curso'],
                                        )),
                                      ),
                                    );
                                  },
                                  child: Column(
                                    /// mano acho que vai ter que trocar eu compilei pro meu celular e bugou o view do pdf vou mandar print no whats
                                    /// blz
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(
                                          left: 40,
                                          right: 45,
                                          top: 30,
                                        ),
                                        child: Column(
                                          children: [
                                            Icon(
                                              Icons.picture_as_pdf_outlined,
                                              color: color,
                                              size: 100,
                                            ),
                                            Text(
                                              snapshot.data[index]['nome'],
                                              style: TextStyle(fontSize: 25),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              );
            } else {
              return Center(child: Text('Nenhum dado para mostrar'));
            }
          } else {
            return Center(
              child: Container(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Color(0xFFC75555)),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}

/*
acessar lista de dados

*/

const baseUrl = 'https://rumanian-straighten.000webhostapp.com/repo/repo.php';
//"http://192.168.0.110:80/RepoFlutter/repo.php";

Future<dynamic> getRepo() async {
  var response = await Dio().get(baseUrl);
  print(response.data);
  return response.data;
}

class InsereProjetoController {
  var url = ' ';

  Future<Response<dynamic>> insereProjeto({
    String projeto,
    String latitude,
    String longitude,
  }) async {
    return Dio()
        .post(
      url,
      data: {
        'projeto': projeto,
        'latitude': latitude,
        'longitude': longitude,
      },
      options: Options(contentType: 'application/json;charset=UTF-8'),
    )
        .then((value) {
      print(value);
      return value;
    }).catchError((e) {
      print('erro: ' + e.toString());
    });
  }
}

class Repo extends StatefulWidget {
  @override
  RepoState createState() => RepoState();
}

class RepoState extends State<Repo> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
