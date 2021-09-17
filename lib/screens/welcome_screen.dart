import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mural_de_recados/screens/contato_screen.dart';
import 'package:mural_de_recados/screens/eventos_screen.dart';
import 'package:mural_de_recados/screens/home_screen.dart';
import 'package:mural_de_recados/screens/info.dart';
import 'package:mural_de_recados/screens/login_screen.dart';
import 'package:url_launcher/url_launcher.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mural Magnus'),
        backgroundColor: Colors.purple,
        centerTitle: true,
      ),
      backgroundColor: Colors.teal[100],
      body: SingleChildScrollView(
        child: Column(children: [
          Image.asset('assets/img/logo.png'),
          SizedBox(height: 25),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: FlatButton(
                    color: Colors.purple,
                    textColor: Colors.white,
                    padding: EdgeInsets.all(30),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => HomeScreen()));
                    },
                    child: Column(
                      children: <Widget>[
                        FaIcon(
                          FontAwesomeIcons.solidStickyNote,
                          size: 80,
                        ),
                        Text(
                          'Recados',
                          style: TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 15),
                Expanded(
                  child: FlatButton(
                    color: Colors.purple,
                    textColor: Colors.white,
                    padding: EdgeInsets.all(30),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => EventosScreen()));
                    },
                    child: Column(
                      children: <Widget>[
                        Icon(
                          Icons.event_available,
                          size: 80,
                        ),
                        Text(
                          'Eventos',
                          style: TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 15),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: FlatButton(
                    color: Colors.purple,
                    textColor: Colors.white,
                    padding: EdgeInsets.all(30),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => ContatoScreen()));
                    },
                    child: Column(
                      children: <Widget>[
                        Icon(
                          Icons.contact_phone,
                          size: 80,
                        ),
                        Text(
                          'Contato',
                          style: TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 15),
                Expanded(
                  child: FlatButton(
                    color: Colors.purple,
                    textColor: Colors.white,
                    padding: EdgeInsets.all(30),
                    onPressed: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => InfoView()));
                    },
                    child: Column(
                      children: <Widget>[
                        Icon(
                          Icons.info,
                          size: 80,
                        ),
                        Text(
                          'Sobre',
                          style: TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 15),
        ]),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.teal,
        shape: const CircularNotchedRectangle(),
        child: FlatButton(
          color: Colors.teal,
          textColor: Colors.white,
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => LoginChoose()));
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Icon(
                Icons.lock,
                size: 20,
              ),
              Text(
                'Área Restrita',
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.purple,
        onPressed: () => launch("tel:4335253033"),
        child: Icon(Icons.phone),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
