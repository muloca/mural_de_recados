import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mural_de_recados/widget/title/evento_title.dart';

class EventosScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.teal[100],
        appBar: AppBar(
            backgroundColor: Colors.purple,
            title: Text('Eventos')
            ),
        body:Column(
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
                  color: Colors.teal[600]
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Expanded(
              child: FutureBuilder<QuerySnapshot>(
              future: Firestore.instance.collection('eventos')
              .orderBy('now', descending: true).getDocuments(),
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
            ))
          ],
        ),
      );
    
  }
}