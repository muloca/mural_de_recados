import 'package:flutter/material.dart';
import 'package:mural_de_recados/dados/recado_dado.dart';
import 'package:mural_de_recados/screens/recado_screen.dart';

class RecadoTitle extends StatelessWidget {

  final RecadoData dado;

  RecadoTitle(this.dado);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.apps, size: 40.0, color: Colors.purple,),
      title: Text(dado.titulo, style: TextStyle(
        fontSize: 25.0,
        fontWeight: FontWeight.bold
      ),
      ),
      subtitle: Text('${dado.data} / ${dado.setor}'),
      trailing: Icon(Icons.arrow_right, size: 50.0, color: Colors.purple,),
      onTap: (){
        Navigator.of(context).push(
          MaterialPageRoute(builder: 
            (context)=>RecadoScreen(dado))
        );
      },
    );
  }
}