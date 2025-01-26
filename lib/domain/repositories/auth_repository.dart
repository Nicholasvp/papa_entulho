import 'package:firebase_auth/firebase_auth.dart';
import 'package:papa_entulho/domain/models/user_model.dart';
import 'package:papa_entulho/domain/repositories/database_repository.dart';

class AuthRepository extends DatabaseRepository {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  String get ref => 'users';

  Future<User?> login({required String email, required String password}) async {
    try {
      final userCredential = await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
      if (userCredential.user == null) {
        return null;
      }

      final user = UserModel(id: userCredential.user!.uid, name: 'teste', email: email);
      saveData(user.toJson(), uuid: user.id);
      return userCredential.user;
    } catch (e) {
      return null;
    }
  }

  Future<bool> logout() async {
    try {
      await _firebaseAuth.signOut();
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<User?> register({required String email, required String password}) async {
    try {
      final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
      return userCredential.user!;
    } catch (e) {
      return null;
    }
  }

  bool get isLoggedIn => _firebaseAuth.currentUser != null;
}
