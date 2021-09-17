import 'package:flutter/material.dart';
import 'package:mural_de_recados/admin/view_recados/screens/eventos_screen.dart';
import 'package:mural_de_recados/admin/view_recados/screens/home_screen.dart';
import 'package:mural_de_recados/admin/views/save_evento.dart';
import 'package:mural_de_recados/admin/views/save_recado.dart';
import 'package:mural_de_recados/admin/views/start_screen.dart';
import 'package:url_launcher/url_launcher.dart';

class InfoView extends StatefulWidget {
  @override
  _InfoViewState createState() => _InfoViewState();
}

class _InfoViewState extends State<InfoView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MLCdigital'),
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
        child: Container(
          padding: EdgeInsets.all(15),
          child: Column(children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(5, 10, 5, 0),
              child: Image.asset(
                'assets/logo/mlc.png',
                scale: 3,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'O Mural de Recados é um aplicativo desenvolvido por MLCdigital, para tirar a necessidade '
              'do uso de papel para envio de recados para os pais e alunos',
              style: TextStyle(
                fontSize: 18,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 30),
            Text(
              'Está precisando de uma solução para sua empresa?',
              style: TextStyle(
                fontSize: 18,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              'Entre em contato.',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 30),
            Row(children: <Widget>[
              Expanded(
                child: RaisedButton(
                  color: Colors.teal[100],
                  onPressed: () => launch("tel:43996730232"),
                  child: Text(
                    'Ligar',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SizedBox(width: 15),
              Expanded(
                child: RaisedButton(
                  color: Colors.teal[100],
                  onPressed: () => launch('mailto:murilolcabral@gmail.com'),
                  child: Text('E-mail',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                ),
              ),
              SizedBox(width: 15),
              Expanded(
                child: RaisedButton(
                    color: Colors.teal[100],
                    onPressed: () => launch(
                        'https://api.whatsapp.com/send?phone=5543996730232'),
                    child: Text(
                      'WhatsApp',
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                    )),
              ),
            ]),
            SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Text(
                'Estamos a disposição para participar do seu projeto que vai inovar a forma de fazer algo!',
                textAlign: TextAlign.center,
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
