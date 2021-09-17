import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class NovoUsuario extends StatefulWidget {
  @override
  _NovoUsuarioState createState() => _NovoUsuarioState();
}

class _NovoUsuarioState extends State<NovoUsuario> {
  PageController _pageController;

  int _page = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  final snackBar = SnackBar(
      duration: Duration(seconds: 6),
      backgroundColor: Colors.green,
      content: Text('Usuário salvo com sucesso!',
          style: TextStyle(fontSize: 20), textAlign: TextAlign.center));

  var _scaffoldKey = GlobalKey<ScaffoldState>();

  final fire = Firestore.instance;

  final _emailController = TextEditingController();
  final _senhaController = TextEditingController();
  final _nomeController = TextEditingController();
  final _classeController = TextEditingController();
  final _setorController = TextEditingController();

  final formKey = GlobalKey<FormState>();
  final formKey2 = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Novo Usuário'),
        backgroundColor: Colors.green,
        centerTitle: true,
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _page,
          onTap: (p) {
            _pageController.animateToPage(p,
                duration: Duration(milliseconds: 500), curve: Curves.ease);
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.person_add),
              title: Text('Aluno'),
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.person_outline), title: Text('Professor'))
          ]),
      body: PageView(
          controller: _pageController,
          onPageChanged: (p) {
            setState(() {
              _page = p;
            });
          },
          children: <Widget>[
            Container(
              child: Form(
                key: formKey2,
                child: ListView(
                  padding: EdgeInsets.all(8.0),
                  children: <Widget>[
                    Text(
                      'Preencha os dados do Aluno',
                      style: TextStyle(fontSize: 25, color: Colors.teal),
                    ),
                    TextFormField(
                      controller: _classeController,
                      decoration: InputDecoration(
                        labelText: 'Classe do Aluno',
                      ),
                      keyboardType: TextInputType.text,
                    ),
                    TextFormField(
                      controller: _nomeController,
                      decoration: InputDecoration(hintText: 'Nome Completo'),
                      keyboardType: TextInputType.text,
                    ),
                    TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(hintText: 'e-mail'),
                      keyboardType: TextInputType.emailAddress,
                    ),
                    TextFormField(
                      controller: _senhaController,
                      decoration: InputDecoration(hintText: 'senha'),
                      keyboardType: TextInputType.text,
                      maxLines: null,
                    ),
                    SizedBox(
                      height: 18,
                    ),
                    SizedBox(
                        height: 44.0,
                        child: RaisedButton(
                            child: Text('Salvar Aluno',
                                style: TextStyle(fontSize: 25)),
                            textColor: Colors.white,
                            color: Colors.green,
                            onPressed: () {
                              Firestore.instance
                                  .collection('user')
                                  .document()
                                  .setData({
                                'classe': _classeController.text,
                                'email': _emailController.text,
                                'senha': _senhaController.text,
                                'nome': _nomeController.text,
                              });
                              formKey2.currentState.reset();
                              return _scaffoldKey.currentState
                                  .showSnackBar(snackBar);
                            }))
                  ],
                ),
              ),
            ),
            Container(
              child: Form(
                key: formKey,
                child: ListView(
                  padding: EdgeInsets.all(8.0),
                  children: <Widget>[
                    Text(
                      'Preencha os dados do Professor/Admin',
                      style: TextStyle(fontSize: 25, color: Colors.teal),
                    ),
                    TextFormField(
                      controller: _setorController,
                      decoration: InputDecoration(
                        labelText: 'Matéria / Setor',
                      ),
                      keyboardType: TextInputType.text,
                    ),
                    TextFormField(
                      controller: _nomeController,
                      decoration: InputDecoration(hintText: 'Nome Completo'),
                      keyboardType: TextInputType.text,
                    ),
                    TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(hintText: 'e-mail'),
                      keyboardType: TextInputType.emailAddress,
                    ),
                    TextFormField(
                      controller: _senhaController,
                      decoration: InputDecoration(hintText: 'senha'),
                      keyboardType: TextInputType.text,
                      maxLines: null,
                    ),
                    SizedBox(
                      height: 18,
                    ),
                    SizedBox(
                        height: 44.0,
                        child: RaisedButton(
                            child: Text('Salvar Professor',
                                style: TextStyle(fontSize: 25)),
                            textColor: Colors.white,
                            color: Colors.green,
                            onPressed: () {
                              Firestore.instance
                                  .collection('admin')
                                  .document()
                                  .setData({
                                'setor': _setorController.text,
                                'email': _emailController.text,
                                'senha': _senhaController.text,
                                'nome': _nomeController.text,
                              });
                              formKey.currentState.reset();
                              return _scaffoldKey.currentState
                                  .showSnackBar(snackBar);
                            }))
                  ],
                ),
              ),
            ),
          ]),
    );
  }
}
