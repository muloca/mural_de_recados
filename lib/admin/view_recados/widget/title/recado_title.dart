import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mural_de_recados/admin/view_recados/dados/recado_dado.dart';
import 'package:mural_de_recados/admin/view_recados/screens/recado_screen.dart';


class RecadoTitle extends StatelessWidget {

  final RecadoData dado;

  RecadoTitle(this.dado);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.apps, size: 40.0, color: Colors.purple,),
      title: Text(dado.titulo, style: TextStyle(
        fontSize: 25.0,
        fontWeight: FontWeight.bold
      ),
      ),
      subtitle: Text('${dado.data} / ${dado.setor}'),
      trailing: RaisedButton(
        onPressed: (){
          Firestore.instance.collection('magnus')
          .document(dado.categoria).collection('recado')
          .document(dado.id).delete();
          Navigator.of(context).pop();
        },
        child: Text('APAGAR'),
        color: Colors.red,
        textColor: Colors.white,
        ),
      onTap: (){
        Navigator.of(context).push(
          MaterialPageRoute(builder: 
            (context)=>RecadoScreen(dado))
        );
      },
    );
  }
}