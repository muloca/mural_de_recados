import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mural_de_recados/admin/view_recados/screens/eventos_screen.dart';
import 'package:mural_de_recados/admin/view_recados/screens/home_screen.dart';
import 'package:mural_de_recados/admin/views/save_evento.dart';
import 'package:mural_de_recados/admin/views/start_screen.dart';

import 'info.dart';

class SaveRecado extends StatefulWidget {
  @override
  _SaveRecadoState createState() => _SaveRecadoState();
}

class _SaveRecadoState extends State<SaveRecado> {
  final snackBar = SnackBar(
      duration: Duration(seconds: 6),
      backgroundColor: Colors.green,
      content: Text('Recado enviado com sucesso!',
          style: TextStyle(fontSize: 20), textAlign: TextAlign.center));

  var _scaffoldKey = GlobalKey<ScaffoldState>();

  final fire = Firestore.instance;

  final _dataController = TextEditingController();
  final _recadoController = TextEditingController();
  final _responsavelController = TextEditingController();
  final _setorController = TextEditingController();
  final _tituloController = TextEditingController();
  final _serieController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Magnus Educação'),
        backgroundColor: Colors.purple,
        centerTitle: true,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 40, 10, 0),
                  child: Image.asset('assets/img/logo.png'),
                ),
              ],
            ),
            SizedBox(height: 30),
            ListTile(
              leading: Icon(Icons.home, color: Colors.purple),
              title: Text('Tela Inicial',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.purple)),
              onTap: () {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (conext) => StartScreen()));
              },
            ),
            ListTile(
              leading: Icon(Icons.mode_edit, color: Colors.teal),
              title: Text('Adicionar novo Recado',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal)),
              onTap: () {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (conext) => SaveRecado()));
              },
            ),
            ListTile(
              leading: Icon(Icons.mode_edit, color: Colors.teal),
              title: Text('Adicionar novo Evento',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal)),
              onTap: () {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (conext) => SaveEvento()));
              },
            ),
            ListTile(
              leading: Icon(
                Icons.delete_forever,
                color: Colors.red,
              ),
              title: Text('Remover Recados',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.red)),
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (conext) => HomeScreen()));
              },
            ),
            ListTile(
              leading: Icon(
                Icons.delete_forever,
                color: Colors.red,
              ),
              title: Text('Remover Eventos',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.red)),
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (conext) => EventosScreen()));
              },
            ),
            ListTile(
              leading: Icon(
                Icons.info,
                color: Colors.blueGrey,
              ),
              title: Text('Sobre o app',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueGrey)),
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => InfoView()));
              },
            )
          ],
        ),
      ),
      body: Form(
        key: formKey,
        child: ListView(
          padding: EdgeInsets.all(8.0),
          children: <Widget>[
            Text(
              'Adicione seu novo recado',
              style: TextStyle(fontSize: 25, color: Colors.teal),
            ),
            TextFormField(
              controller: _serieController,
              decoration: InputDecoration(
                  labelText: 'Classe. ex: 2serie ou 8ano',
                  hintText: 'não coloque acentos ou divisão ex: 6ano"'),
              keyboardType: TextInputType.text,
            ),
            TextFormField(
              controller: _tituloController,
              decoration: InputDecoration(hintText: 'Título do recado'),
              keyboardType: TextInputType.text,
            ),
            TextFormField(
              controller: _dataController,
              decoration: InputDecoration(
                  hintText: 'Data "Separe com / ex: 01/01/2020"'),
              keyboardType: TextInputType.text,
            ),
            TextFormField(
              controller: _recadoController,
              decoration: InputDecoration(hintText: 'Digite o seu recado'),
              keyboardType: TextInputType.multiline,
              maxLines: null,
            ),
            TextFormField(
              controller: _responsavelController,
              decoration:
                  InputDecoration(hintText: 'Quem está enviando o recado?'),
              keyboardType: TextInputType.text,
            ),
            TextFormField(
              controller: _setorController,
              decoration: InputDecoration(hintText: 'Qual setor da escola?'),
              keyboardType: TextInputType.text,
            ),
            SizedBox(
              height: 18,
            ),
            SizedBox(
                height: 44.0,
                child: RaisedButton(
                    child:
                        Text('Enviar Recado', style: TextStyle(fontSize: 25)),
                    textColor: Colors.white,
                    color: Theme.of(context).primaryColor,
                    onPressed: () {
                      Firestore.instance
                          .collection('magnus')
                          .document(_serieController.text)
                          .collection('recado')
                          .document()
                          .setData({
                        'classe': _serieController.text,
                        'data': _dataController.text,
                        'recado': _recadoController.text,
                        'responsavel': _responsavelController.text,
                        'titulo': _tituloController.text,
                        'setor': _setorController.text,
                        'now': DateTime.now()
                      });
                      formKey.currentState.reset();
                      return _scaffoldKey.currentState.showSnackBar(snackBar);
                    }))
          ],
        ),
      ),
    );
  }
}
