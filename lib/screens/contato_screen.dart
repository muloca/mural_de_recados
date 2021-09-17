import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class ContatoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[100],
      appBar: AppBar(
        title: Text('Contato'),
        backgroundColor: Colors.purple,
      ),
      body: Column(children: <Widget>[
        Image.asset('assets/img/logo.png'),
        SizedBox(
          height: 15,
        ),
        Row(
          children: <Widget>[
            SizedBox(width: 10),
            Expanded(
              child: OutlineButton(
                padding: EdgeInsets.symmetric(horizontal: 5),
                onPressed: () => launch(
                    "https://www.google.com.br/maps/place/R.+Cel.+Cec%C3%ADlio+Rocha,+395,+Jacarezinho+-+PR,+86400-000/@-23.1611009,-49.9780458,17z/data=!3m1!4b1!4m5!3m4!1s0x94c02654ed73baf1:0xa9a7dca6ef19cd28!8m2!3d-23.1611058!4d-49.9758571"),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('R. Cel. Cecílio Rocha, 395 - Centro',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    SizedBox(width: 10),
                    FaIcon(FontAwesomeIcons.mapMarkerAlt)
                  ],
                ),
                textColor: Colors.purple,
                borderSide: BorderSide(color: Colors.purple),
              ),
            ),
            SizedBox(width: 10),
          ],
        ),
        SizedBox(
          height: 15,
        ),
        Row(
          children: <Widget>[
            SizedBox(width: 10),
            Expanded(
              child: OutlineButton(
                padding: EdgeInsets.symmetric(horizontal: 5),
                onPressed: () => launch("tel:4335253033"),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('Secretaria',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    SizedBox(width: 10),
                    Icon(Icons.phone_iphone)
                  ],
                ),
                textColor: Colors.purple,
                borderSide: BorderSide(color: Colors.purple),
              ),
            ),
            SizedBox(width: 10),
          ],
        ),
        SizedBox(
          height: 15,
        ),
        Row(
          children: <Widget>[
            SizedBox(width: 10),
            Expanded(
              child: OutlineButton(
                padding: EdgeInsets.symmetric(horizontal: 5),
                onPressed: () =>
                    launch("https://www.facebook.com/magnuseducacao/"),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('Facebook',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    SizedBox(width: 10),
                    FaIcon(FontAwesomeIcons.facebook)
                  ],
                ),
                textColor: Colors.purple,
                borderSide: BorderSide(color: Colors.purple),
              ),
            ),
            SizedBox(width: 10),
          ],
        ),
        SizedBox(
          height: 15,
        ),
        Row(
          children: <Widget>[
            SizedBox(width: 10),
            Expanded(
              child: OutlineButton(
                padding: EdgeInsets.symmetric(horizontal: 5),
                onPressed: () => launch(
                    "https://www.instagram.com/magnuseducacao/?hl=pt-br"),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('Instagram',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    SizedBox(width: 10),
                    FaIcon(FontAwesomeIcons.instagram)
                  ],
                ),
                textColor: Colors.purple,
                borderSide: BorderSide(color: Colors.purple),
              ),
            ),
            SizedBox(width: 10),
          ],
        ),
      ]),
    );
  }
}
