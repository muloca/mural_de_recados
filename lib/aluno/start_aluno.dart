import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mural_de_recados/aluno/widgets/card_aluno.dart';
import 'package:mural_de_recados/screens/welcome_screen.dart';

class StartAluno extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Aluno'),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: IconButton(
                icon: FaIcon(
                  FontAwesomeIcons.userSlash,
                  color: Colors.teal,
                  size: 30,
                ),
                onPressed: () {
                  FirebaseAuth.instance.signOut();
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => WelcomeScreen()));
                }),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Align(
              alignment: Alignment.center,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Text(
                'Bem-vindo',
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
            ),
            Text(
              'Aqui estão as tarefas e recados relacionados ao aluno ',
              style: TextStyle(fontSize: 15),
            ),
            CardAluno()
          ],
        ),
      ),
    );
  }
}
