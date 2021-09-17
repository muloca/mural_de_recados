import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mural_de_recados/admin/view_recados/screens/eventos_screen.dart';
import 'package:mural_de_recados/admin/view_recados/screens/home_screen.dart';
import 'package:mural_de_recados/admin/views/save_recado.dart';
import 'package:mural_de_recados/admin/views/start_screen.dart';

import 'info.dart';

class SaveEvento extends StatefulWidget {
  @override
  _SaveEventoState createState() => _SaveEventoState();
}

class _SaveEventoState extends State<SaveEvento> {
  final snackBar = SnackBar(
      duration: Duration(seconds: 6),
      backgroundColor: Colors.green,
      content: Text('Recado enviado com sucesso!',
          style: TextStyle(fontSize: 20), textAlign: TextAlign.center));

  var _scaffoldKey = GlobalKey<ScaffoldState>();

  final fire = Firestore.instance;

  final _dataController = TextEditingController();
  final _descricaoController = TextEditingController();
  final _localController = TextEditingController();
  final _tituloController = TextEditingController();
  final _classeController = TextEditingController();

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
              'Adicione seu novo evento',
              style: TextStyle(fontSize: 25, color: Colors.teal),
            ),
            TextFormField(
              controller: _classeController,
              decoration: InputDecoration(
                labelText: 'Classe que participará do Evento',
              ),
              keyboardType: TextInputType.text,
            ),
            TextFormField(
              controller: _tituloController,
              decoration: InputDecoration(hintText: 'Título do Evento'),
              keyboardType: TextInputType.text,
            ),
            TextFormField(
              controller: _dataController,
              decoration: InputDecoration(
                  hintText: 'Data "Separe com / ex: 01/01/2020"'),
              keyboardType: TextInputType.text,
            ),
            TextFormField(
              controller: _descricaoController,
              decoration: InputDecoration(hintText: 'Descrição do evento'),
              keyboardType: TextInputType.multiline,
              maxLines: null,
            ),
            TextFormField(
              controller: _localController,
              decoration: InputDecoration(hintText: 'Local do Evento'),
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
                          .collection('eventos')
                          .document()
                          .setData({
                        'classe': _classeController.text,
                        'data': _dataController.text,
                        'descricao': _descricaoController.text,
                        'titulo': _tituloController.text,
                        'local': _localController.text,
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
