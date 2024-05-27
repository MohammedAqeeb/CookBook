import 'package:cookbook/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  String? errorMsg;

  /// create user
  Future<UserModel?> createUser(
    String email,
    String password,
    String userName,
  ) async {
    try {
      final UserCredential userCredential =
          await _firebaseAuth.createUserWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );
      final User? firebaseUser = userCredential.user;
      if (firebaseUser != null) {
        firebaseUser.updateDisplayName(userName);
        return UserModel(
          id: firebaseUser.uid,
          email: firebaseUser.email ?? '',
          displayName: firebaseUser.displayName ?? '',
        );
      }
    } on FirebaseAuthException catch (e) {
      if (e.message != null) {
        errorMsg = e.message!;
      }
    }
    return null;
  }

  Future<UserModel?> signInUser(
    String email,
    String password,
  ) async {
    UserModel? userModel;
    try {
      await _firebaseAuth
          .signInWithEmailAndPassword(
            email: email.trim(),
            password: password.trim(),
          )
          .then(
            (UserCredential userCredential) {},
          );
    } on FirebaseAuthException catch (e) {
      if (e.message != null) {
        errorMsg = e.message!;
      }
    }
    return userModel;
  }

  Future<void> signOutUser() async {
    final User? firebaseUser = FirebaseAuth.instance.currentUser;
    if (firebaseUser != null) {
      await FirebaseAuth.instance.signOut();
    }
  }
}
