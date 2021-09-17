import 'package:cloud_firestore/cloud_firestore.dart';

class RecadoData {

  String categoria;

  String id;
  
  String responsavel;

  String data;

  String recado;

  String titulo;

  String setor;

  RecadoData.fromDocument(DocumentSnapshot snapshot){
    id = snapshot.documentID;
    responsavel = snapshot.data['responsavel'];
    data = snapshot.data['data'];
    recado = snapshot.data['recado'];
    titulo = snapshot.data['titulo'];
    setor = snapshot.data['setor'];
    categoria = snapshot.data['classe'];
  }  

}