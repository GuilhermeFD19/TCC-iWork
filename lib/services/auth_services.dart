import 'package:firebase_auth/firebase_auth.dart';

class AutenticationServices {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<String?> cadastrarUsuarios({
    required String nome,
    required String email,
    required String senha,
  }) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: senha,
      );

      await userCredential.user!.updateDisplayName(nome);

      return null;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'senha fraca') {
        print('A senha fornecida é muito fraca.');
      } else if (e.code == 'Usuário já cadastrado') {
        return 'A conta já existe para este e-mail.';
      }
      return "Erro ao cadastrar usuário.";
    }
  }

  Future<String?> logarUsuarios(
      {required String email,
      required String senha,
      required String nome}) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: senha,
      );
      return null;
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  Future<void> deslogar() async {
    return await _firebaseAuth.signOut();
  }
}
