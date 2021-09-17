import 'package:cloud_firestore/cloud_firestore.dart';

class RecadoClass {
  
  String id;
  String classe;
  String data;
  String titulo;
  String local;
  String descricao;
  DateTime now = DateTime.now();

  RecadoClass.fromDocument(DocumentSnapshot snapshot){
    id = snapshot.documentID;
    data = snapshot.data['data'];
    descricao = snapshot.data['descricao'];
    titulo = snapshot.data['titulo'];
    local = snapshot.data['local'];
    classe = snapshot.data['classe'];
    now = snapshot.data['now'];
  }
}