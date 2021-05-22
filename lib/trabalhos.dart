import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

import 'package:repositorio/AbrirPDF.dart';
import 'package:repositorio/TelaLogin.dart';
import 'package:repositorio/repo.dart';

// ignore: must_be_immutable   nao faz sentrido jsjsjsjsjsj
class TrabalhosPage extends StatefulWidget {
  final int trabalhoID;
  final String curso;

  const TrabalhosPage({Key key, this.trabalhoID, this.curso}) : super(key: key);

  @override
  _TrabalhosPageState createState() => _TrabalhosPageState();
}

class _TrabalhosPageState extends State<TrabalhosPage> {
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
    return Scaffold(
      backgroundColor: Color(0xFFffffff),
      appBar: AppBar(
        title: Text(
          widget.curso,
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
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              return Column(
                children: [
                  Container(
                    child: Center(
                      child: Icon(
                        Icons.picture_as_pdf_outlined,
                        //color: color,
                        size: 200,
                      ),
                    ),
                  ),
                  Container(
                    child: Center(
                      child: Text(
                        snapshot.data[widget.trabalhoID]['nome'],
                        style: TextStyle(
                          fontFamily: 'ChewyRegular',
                          fontSize: 30,
                        ),
                      ),

                      /// se pa ta certo sim mano pk o nome dos pdf ta de acorod com os tg sim eu que mosquei
                      /// hausdhasudhausdh vamos testar
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Center(
                            child: Text(
                              snapshot.data[widget.trabalhoID]['desc'],
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                  fontFamily: 'ChewyRegular',
                                  color: Colors.grey[600]),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: FloatingActionButton.extended(
                      label: const Text(
                        'Abrir PDF',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'ChewyRegular',
                        ),
                      ),
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) => (ViewPdf(
                                id: int.parse(
                                    snapshot.data[widget.trabalhoID]['id']),
                              )),
                            ));
                      },
                      icon: const Icon(Icons.launch),
                      backgroundColor: Color(0xFFC75555),
                    ),
                  ),
                ],
              );
            } else {
              return Center(child: Text('Nenhum dado para mostar'));
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
