import 'package:flutter/material.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mural_de_recados/dados/recado_dado.dart';

class RecadoScreen extends StatefulWidget {
  final RecadoData recado;

  RecadoScreen(this.recado);

  @override
  _RecadoScreenState createState() => _RecadoScreenState(recado);
}

class _RecadoScreenState extends State<RecadoScreen> {
//Aqui eu montei um construtor para receber os dados de cima do StateFull
  final RecadoData recado;

  _RecadoScreenState(this.recado);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.teal[100],
        appBar: AppBar(
          title: Text(
            recado.setor,
            style: TextStyle(
              fontSize: 30,
            ),
          ),
          backgroundColor: Colors.purple,
        ),
        body: SingleChildScrollView(
          child: Container(
              color: Colors.teal[100],
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: new Text(recado.data,
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.white)),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                    child: Card(
                      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      color: Colors.teal[400],
                      elevation: 0,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                        child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              ListTile(
                                leading: Icon(
                                  Icons.album,
                                  size: 28,
                                  color: Colors.white,
                                ),
                                title: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    recado.titulo,
                                    style: TextStyle(
                                      fontSize: 30,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                subtitle: Column(
                                  children: <Widget>[
                                    Center(
                                      child: Text(recado.recado,
                                          style: TextStyle(
                                              fontSize: 25, color: Colors.white)),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.fromLTRB(0, 15, 0, 15),
                                      child: Align(
                                        alignment: Alignment.bottomRight,
                                        child: Text(
                                          recado.responsavel,
                                          style: TextStyle(
                                            fontSize: 28.0,
                                            color: Colors.purple,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  RaisedButton(
                                    elevation: 3,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    color: Colors.purple,
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(15.0),
                                      child: Text('OK',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold)),
                                    ),
                                  ),
                                ],
                              ),
                            ]),
                      ),
                    ),
                  ),
                ],
              )),
        ));
  }
}
