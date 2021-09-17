import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:mural_de_recados/screens/escola_screen.dart';

class EventoClass extends StatelessWidget {
  final DocumentSnapshot snapshot;

  EventoClass(this.snapshot);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        Icons.event_available,
        color: Colors.purple,
      ),
      contentPadding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
      title: Align(
        alignment: Alignment.topLeft,
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Text(
                  snapshot.data['titulo'],
                  style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 3),
            Row(
              children: <Widget>[
                Text('data: ' + snapshot.data['data'],
                    style: TextStyle(fontSize: 18)),
              ],
            ),
            Divider(
              color: Colors.purple,
            ),
            Row(
              children: <Widget>[Text('descrição:')],
            ),
            Row(children: <Widget>[
              Expanded(
                child: Text(
                  snapshot.data['descricao'],
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
              ),
            ]),
            Divider(color: Colors.purple),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                'classe: ' + snapshot.data['classe'],
                style: TextStyle(fontSize: 18.0),
              ),
            ),
            Divider(color: Colors.purple),
            Align(
              alignment: Alignment.topLeft,
              child: Text('local: ' + snapshot.data['local'],
                  style: TextStyle(fontSize: 18)),
            ),
          ],
        ),
      ),
      onTap: () {},
    );
  }
}
