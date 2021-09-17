import 'dart:async';

class LoginValidator {
  final validEmail =
      StreamTransformer<String, String>.fromHandlers(handleData: (email, sink) {
    if (email.contains('@')) {
      sink.add(email);
    } else {
      sink.addError('Insira um email válido');
    }
  });

  final validPassword = StreamTransformer<String, String>.fromHandlers(
      handleData: (password, sink) {
    if (password.length > 3) {
      sink.add(password);
    } else {
      sink.addError('Sua senha precisa ter mais de 4 caracteres');
    }
  });
}
