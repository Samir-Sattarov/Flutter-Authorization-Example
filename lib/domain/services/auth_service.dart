import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final auth = FirebaseAuth.instance;

  exit() async {
    await auth.signOut();
  }

  Future<UserCredential> signIn({
    required String email,
    required String password,
  }) async {
    final result = await auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    return result;
  }

  Future<UserCredential> signUp({
    required String email,
    required String password,
  }) async {
    final result = await auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    return result;
  }
}
