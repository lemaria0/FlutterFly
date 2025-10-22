import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'package:quiz/utils/results.dart';

class AuthService {
  final FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;

  AuthService({
    FirebaseAuth? firebaseAuth,
    GoogleSignIn? googleSignIn,
  })  : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance,
        _googleSignIn = googleSignIn ?? GoogleSignIn();

  String getFirebaseAuthErrorMessage(String code) {
    return switch (code) {
      'invalid-email' => 'O e-mail informado não é válido',
      'user-disabled' => 'Esta conta foi desativada',
      'user-not-found' => 'Nenhuma conta foi encontrada com este e-mail',
      'wrong-password' => 'A senha está incorreta',
      'email-already-in-use' => 'Este e-mail já está em uso',
      'operation-not-allowed' => 'Esta operação não está disponível',
      'invalid-credential' => 'Credencial do Google inválida ou expirada',
      'invalid-verification-code' => 'Código de verificação inválido',
      'invalid-verification-id' => 'ID de verificação inválido',
      'too-many-requests' => 'Tente novamente mais tarde',
      'network-request-failed' => 'Sem conexão',
      _ => 'Erro ao entrar com o Google',
    };
  }

  Future<Result<User?>> getInitialUser() async {
    try {
      final result = await _firebaseAuth.authStateChanges().first;
      return Result.ok(result);
    } catch (e) {
      return Result.error(Exception("Erro ao verificar o estado do usuário"));
    }
  }

  Future<Result<String>> getUserUid() async {
    try {
      User? user = _firebaseAuth.currentUser;

      if (user != null) {
        return Result.ok(user.uid);
      } else {
        return Result.error(Exception("Nenhum usuário está autenticado"));
      }
    } catch (e) {
      return Result.error(
          Exception("Erro inesperado ao acessar o UID do usuário"));
    }
  }

  Future<Result<UserCredential>> loginGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        return Result.error(Exception("O login foi cancelado"));
      }

      final googleAuth = await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final userCredential = await _firebaseAuth.signInWithCredential(credential);
      return Result.ok(userCredential);
    } on FirebaseAuthException catch (e) {
      return Result.error(Exception(getFirebaseAuthErrorMessage(e.code)));
    } catch (e) {
      return Result.error(Exception("Erro ao entrar com o Google: $e"));
    }
  }

  Future<Result<void>> logOutFirebase() async {
    try {
      await _firebaseAuth.signOut();
      return const Result.ok(null);
    } catch (e) {
      return Result.error(Exception("Erro inesperado ao deslogar"));
    }
  }
}