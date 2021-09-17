import 'package:cloud_firestore/cloud_firestore.dart';

class RecadoClass {
  
  String id;
  String classe;
  String data;
  String titulo;
  String setor;
  String responsavel;
  String recado;
  DateTime now = DateTime.now();

  RecadoClass.fromDocument(DocumentSnapshot snapshot){
    id = snapshot.documentID;
    responsavel = snapshot.data['responsavel'];
    data = snapshot.data['data'];
    recado = snapshot.data['recado'];
    titulo = snapshot.data['titulo'];
    setor = snapshot.data['setor'];
    classe = snapshot.data['classe'];
    now = snapshot.data['now'];
  }
}