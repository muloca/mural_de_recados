import 'package:flutter/material.dart';

class CardAluno extends StatelessWidget {
  final bool corTarefa = false;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Card(
      color: corTarefa ? Colors.green[50] : Colors.red[50],
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.text_fields),
            title: Row(
              children: <Widget>[
                Text('Tarefa: '), //tipo String
                Text('Trabalho de Scratch') //tarefa String
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                Text('Tarefa concluída '), // concluida Bool
                Text('dia: 10/07/2020') // data DataTime
              ],
            ),
          ),
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: <Widget>[
                  Text('Professor: '),
                  Text('Murilo') //professor String
                ],
              )),
        ],
      ),
    ));
  }
}
