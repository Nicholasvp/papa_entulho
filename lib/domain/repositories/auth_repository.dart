import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:papa_entulho/domain/models/user_model.dart';
import 'package:papa_entulho/domain/repositories/database_repository.dart';
import 'package:papa_entulho/domain/routes/routes.dart';

class AuthRepository extends DatabaseRepository {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  UserModel? currentUser;

  @override
  String get ref => 'users';

  Future<User?> login({required String email, required String password}) async {
    try {
      final userCredential = await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
      if (userCredential.user == null) {
        return null;
      }
      await _getUser();

      return userCredential.user;
    } catch (e) {
      Get.snackbar('Erro', e.toString());
      return null;
    }
  }

  Future<bool> logout() async {
    try {
      await _firebaseAuth.signOut();
      Get.offAllNamed(Routes.LOGIN);
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<User?> register({required String email, required String password, required String name, required String phone}) async {
    try {
      final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);

      final user = UserModel(id: userCredential.user!.uid, name: name, email: email, phone: phone);
      await createData(user.toJson(), uuid: user.id);
      await _getUser();

      return userCredential.user!;
    } catch (e) {
      return null;
    }
  }

  Future<void> _getUser() async {
    final user = _firebaseAuth.currentUser;
    if (user != null) {
      final data = await getData(collection: ref, id: user.uid);
      currentUser = UserModel.fromJson(data);
    }
  }

  bool get isLoggedIn => _firebaseAuth.currentUser != null;
}
