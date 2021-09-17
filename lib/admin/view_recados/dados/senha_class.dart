import 'package:cloud_firestore/cloud_firestore.dart';

class SenhaClass {
  
  String id;
  String senha;

  SenhaClass.fromDocument(DocumentSnapshot snapshot){
    id = snapshot.documentID;
    senha = snapshot.data['senha'];
  }
}