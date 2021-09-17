import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mural_de_recados/admin/view_recados/widget/title/evento_title.dart';
import 'package:mural_de_recados/admin/views/info.dart';
import 'package:mural_de_recados/admin/views/save_evento.dart';
import 'package:mural_de_recados/admin/views/save_recado.dart';
import 'package:mural_de_recados/admin/views/start_screen.dart';

import 'home_screen.dart';

class EventosScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[100],
      appBar: AppBar(backgroundColor: Colors.purple, title: Text('Eventos')),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: Image.asset('assets/img/logo.png'),
                ),
              ],
            ),
            SizedBox(height: 30),
            ListTile(
              leading: Icon(Icons.home, color: Colors.purple),
              title: Text('Tela Inicial',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.purple)),
              onTap: () {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (conext) => StartScreen()));
              },
            ),
            ListTile(
              leading: Icon(Icons.mode_edit, color: Colors.teal),
              title: Text('Adicionar novo Recado',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal)),
              onTap: () {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (conext) => SaveRecado()));
              },
            ),
            ListTile(
              leading: Icon(Icons.mode_edit, color: Colors.teal),
              title: Text('Adicionar novo Evento',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal)),
              onTap: () {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (conext) => SaveEvento()));
              },
            ),
            ListTile(
              leading: Icon(
                Icons.delete_forever,
                color: Colors.red,
              ),
              title: Text('Remover Recados',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.red)),
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (conext) => HomeScreen()));
              },
            ),
            ListTile(
              leading: Icon(
                Icons.delete_forever,
                color: Colors.red,
              ),
              title: Text('Remover Eventos',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.red)),
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (conext) => EventosScreen()));
              },
            ),
            ListTile(
              leading: Icon(
                Icons.info,
                color: Colors.blueGrey,
              ),
              title: Text('Sobre o app',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueGrey)),
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => InfoView()));
              },
            )
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(0, 30.0, 0, 10.0),
            child: Text(
              'Próximos Eventos',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.teal[600]),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Expanded(
              child: FutureBuilder<QuerySnapshot>(
            future: Firestore.instance
                .collection('eventos')
                .orderBy('now', descending: true)
                .getDocuments(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Container(
                  alignment: Alignment.center,
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.black45),
                  ),
                );
              } else {
                var dividedTiles = ListTile.divideTiles(
                        tiles: snapshot.data.documents.map((doc) {
                          return EventoClass(doc);
                        }).toList(),
                        color: Colors.purple)
                    .toList();

                return ListView(children: dividedTiles);
              }
            },
          )),
        ],
      ),
    );
  }
}
