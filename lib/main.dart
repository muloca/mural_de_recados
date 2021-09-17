import 'package:flutter/material.dart';
import 'package:mural_de_recados/screens/welcome_screen.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Start do Onesignal
    OneSignal.shared.init('2a102828-aed1-4caf-8806-3a9a67a5b199');

    OneSignal.shared
        .setInFocusDisplayType(OSNotificationDisplayType.notification);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mural de Recados',
      theme: ThemeData(primaryColor: Colors.purple),
      home: WelcomeScreen(),
    );
  }
}
