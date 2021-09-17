import 'package:flutter/material.dart';
import 'package:mural_de_recados/admin/login/login_bloc_professor.dart';
import 'package:mural_de_recados/admin/views/start_screen.dart';
import 'package:mural_de_recados/aluno/widgets/input_field.dart';
import 'package:mural_de_recados/screens/login_screen.dart';

class LoginProfessor extends StatefulWidget {
  @override
  _LoginProfessorState createState() => _LoginProfessorState();
}

class _LoginProfessorState extends State<LoginProfessor> {
  final _loginBloc = LoginBlocProfessor();

  @override
  void initState() {
    super.initState();

    _loginBloc.outState.listen((state) {
      switch (state) {
        case LoginState.SUCCESS:
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => StartScreen()));
          break;
        case LoginState.FAIL:
          showDialog(
              context: context,
              builder: (context) => AlertDialog(
                    title: Text('Erro'),
                    content: Text('Você não é um Professor'),
                  ));
          break;
        case LoginState.LOADING:
        case LoginState.IDLE:
      }
    });
  }

  @override
  void dispose() {
    _loginBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      body: StreamBuilder<LoginState>(
          stream: _loginBloc.outState,
          initialData: LoginState.LOADING,
          builder: (context, snapshot) {
            switch (snapshot.data) {
              case LoginState.LOADING:
                return Center(
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation(Colors.teal),
                  ),
                );
              case LoginState.FAIL:
              case LoginState.IDLE:
              case LoginState.SUCCESS:
                return Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    Container(),
                    SingleChildScrollView(
                      child: Container(
                        margin: EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            Align(
                              alignment: Alignment.center,
                              child: Text('Professores',
                                  style: TextStyle(
                                      fontSize: 30,
                                      color: Colors.purple,
                                      fontWeight: FontWeight.bold)),
                            ),
                            Icon(
                              Icons.person,
                              size: 160,
                              color: Colors.teal,
                            ),
                            InputField(
                              icon: Icons.person_outline,
                              hint: 'Usuário',
                              obscure: false,
                              stream: _loginBloc.outEmail,
                              onChanged: _loginBloc.changeEmail,
                            ),
                            InputField(
                              icon: Icons.person_outline,
                              hint: 'Senha',
                              obscure: true,
                              stream: _loginBloc.outPassword,
                              onChanged: _loginBloc.changePassword,
                            ),
                            SizedBox(
                              height: 25,
                            ),
                            StreamBuilder<bool>(
                                stream: _loginBloc.outCamposValidos,
                                builder: (context, snapshot) {
                                  return SizedBox(
                                    height: 50,
                                    child: RaisedButton(
                                      onPressed: snapshot.hasData
                                          ? _loginBloc.submit
                                          : null,
                                      color: Colors.teal,
                                      child: Text('Entrar'),
                                      textColor: Colors.white,
                                      disabledColor: Colors.teal[150],
                                    ),
                                  );
                                }),
                            SizedBox(
                              height: 15,
                            ),
                            RaisedButton(
                              color: Colors.teal,
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => LoginChoose()));
                              },
                              child: Text('Voltar'),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              default:
                return Container();
            }
          }),
    );
  }
}
