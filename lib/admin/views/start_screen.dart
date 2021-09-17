import 'package:flutter/material.dart';
import 'package:mural_de_recados/admin/view_recados/screens/eventos_screen.dart';
import 'package:mural_de_recados/admin/view_recados/screens/home_screen.dart';
import 'package:mural_de_recados/admin/views/novo_usuario.dart';
import 'package:mural_de_recados/admin/views/save_evento.dart';
import 'package:mural_de_recados/admin/views/save_recado.dart';

import 'info.dart';

class StartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[100],
      appBar: AppBar(
        title: Text('Painel Mural'),
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
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            // Image.asset('assets/img/logo.png'),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: RaisedButton(
                      color: Colors.purple,
                      textColor: Colors.white,
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => SaveRecado()));
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Column(
                          children: <Widget>[
                            Icon(
                              Icons.edit,
                              size: 80,
                            ),
                            SizedBox(height: 8),
                            Text('Novo Recado', style: TextStyle(fontSize: 20)),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: RaisedButton(
                      color: Colors.purple,
                      textColor: Colors.white,
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => SaveEvento()));
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Column(
                          children: <Widget>[
                            Icon(
                              Icons.event_available,
                              size: 80,
                            ),
                            SizedBox(height: 8),
                            Text('Novo Evento', style: TextStyle(fontSize: 20)),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: RaisedButton(
                      color: Colors.red,
                      textColor: Colors.white,
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => HomeScreen()));
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Column(
                          children: <Widget>[
                            Icon(
                              Icons.edit,
                              size: 80,
                            ),
                            SizedBox(height: 8),
                            Text('Remover Recado',
                                style: TextStyle(fontSize: 20)),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: RaisedButton(
                      color: Colors.red,
                      textColor: Colors.white,
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => EventosScreen()));
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Column(
                          children: <Widget>[
                            Icon(
                              Icons.event_available,
                              size: 80,
                            ),
                            SizedBox(height: 8),
                            Text('Remover Evento',
                                style: TextStyle(fontSize: 20)),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: RaisedButton(
                      color: Colors.green,
                      textColor: Colors.white,
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => NovoUsuario()));
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Column(
                          children: <Widget>[
                            Icon(
                              Icons.person_add,
                              size: 80,
                            ),
                            SizedBox(height: 8),
                            Text('Novo Usuário',
                                style: TextStyle(fontSize: 20)),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
