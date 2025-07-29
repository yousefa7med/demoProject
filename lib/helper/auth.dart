import 'package:firebase_auth/firebase_auth.dart';

class Auth {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Add your methods here, for example:
  Future<UserCredential> signUp(String email, String password) async {
    return await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<UserCredential> login(String email, String password) async {
    return await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<void> logout() async {
    return await _auth.signOut();
  }

  Future<void> sendVerfiyEmail() async {
    return await _auth.currentUser!.sendEmailVerification();
  }
}
