import 'package:flutter/material.dart';

class CadProj extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFffffff),
      appBar: AppBar(
        title: Text(
          "CADASTRA PROJETO",
          style: TextStyle(fontFamily: 'ChewyRegular', fontSize: 25),
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
                    builder: (BuildContext context) => (null),
                  ));
            },
          ),
        ],
      ),
      body: Container(
        color: Color(0xFFC75555),
        child: Padding(
          padding: const EdgeInsets.all(6),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            //height: 0.1,
            child: Center(
              child: Column(
                children: [
                  Center(
                    child: Text(
                      "POSTAR NO REPOSITÓRIO",
                      style:
                          TextStyle(fontFamily: 'ChewyRegular', fontSize: 18),
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Container(
                        width: 400,
                        child: Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                cursorColor: Color(0xFFC75555),
                                decoration: InputDecoration(
                                  labelText: "DESENVOLVEDOR",
                                  labelStyle:
                                      TextStyle(color: Color(0xFFC75555)),
                                  fillColor: Color(0xFFC75555),
                                  focusedBorder: OutlineInputBorder(
                                    //borderRadius: BorderRadius.circular(25.0),
                                    borderSide: BorderSide(
                                      color: Color(0xFFC75555),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            FloatingActionButton(
                              onPressed: null,
                              backgroundColor: Color(0xFFC75555),
                              child: const Icon(Icons.add),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
