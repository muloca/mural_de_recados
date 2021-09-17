import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mural_de_recados/admin/view_recados/screens/escola_screen.dart';


class HomeClass extends StatelessWidget {

  final DocumentSnapshot snapshot;

  HomeClass(this.snapshot);


  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.apps, color: Colors.purple,),
      contentPadding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
      title: Text(
        snapshot.data['classe'],
        style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
      ),
      trailing: Icon(Icons.arrow_right, size: 60, color: Colors.purple,),
      onTap: () {
        Navigator.of(context).push(
            MaterialPageRoute(builder: (conext) => EscolaScreen(snapshot)));
      },
    );
  }
}