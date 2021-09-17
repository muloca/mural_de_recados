import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mural_de_recados/dados/recado_dado.dart';
import 'package:mural_de_recados/widget/title/recado_title.dart';

class EscolaScreen extends StatelessWidget {
  final DocumentSnapshot snapshot;

  EscolaScreen(this.snapshot);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.teal[100],
        appBar: AppBar(
          title: Text(snapshot.data['classe']),
          centerTitle: true,
          backgroundColor: Colors.purple,
        ),
        body: FutureBuilder<QuerySnapshot>(
            future: Firestore.instance
                .collection('magnus')
                .document(snapshot.documentID)
                .collection('recado').orderBy('now', descending: true)
                .getDocuments(),
            builder: (context, snapshot) {
              if (!snapshot.hasData)
                return Center(
                  child: CircularProgressIndicator(),
                );
              else
                return Padding(
                  padding: EdgeInsets.only(top: 25.0),
                  child: ListView.builder(
                    padding: EdgeInsets.all(4.0),
                    itemCount: snapshot.data.documents.length,
                    itemBuilder: (context, index) {
                      return RecadoTitle(RecadoData.fromDocument(
                          snapshot.data.documents[index]));
                    },
                  ),
                );
            }));
  }
}
