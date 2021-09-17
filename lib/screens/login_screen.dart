import 'package:flutter/material.dart';
import 'package:mural_de_recados/admin/views/hello_screen.dart';
import 'package:mural_de_recados/admin/views/login_professor.dart';
import 'package:mural_de_recados/aluno/login_aluno.dart';

class LoginChoose extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Image.asset('assets/img/logo.png'),
          SizedBox(
            height: 25,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: OutlineButton(
                    onPressed: () => Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => LoginAluno())),
                    color: Colors.teal,
                    borderSide: BorderSide(color: Colors.teal),
                    child: Text(
                      'Sou Aluno',
                      style: TextStyle(color: Colors.teal),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: OutlineButton(
                    onPressed: () => Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => LoginProfessor())),
                    color: Colors.teal,
                    borderSide: BorderSide(color: Colors.purple),
                    child: Text(
                      'Sou Professor',
                      style: TextStyle(color: Colors.purple),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: OutlineButton(
                    onPressed: () => Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => HelloScreen())),
                    color: Colors.teal,
                    borderSide: BorderSide(color: Colors.black),
                    child: Text(
                      'Administração',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
