import 'package:cloud_firestore/cloud_firestore.dart';

class EventoDado {
  String id;
  String titulo;
  String local;
  String responsavel;
  String descricao;
  String data;
  String classe;

  EventoDado.fromDocument(DocumentSnapshot snapshot) {
    id = snapshot.documentID;
    titulo = snapshot.data['titulo'];
    local = snapshot.data['local'];
    responsavel = snapshot.data['responsavel'];
    descricao = snapshot.data['descricao'];
    data = snapshot.data['data'];
    classe = snapshot.data['classe'];
  }
}
