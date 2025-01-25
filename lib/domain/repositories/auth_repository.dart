class AuthRepository {
  Future<bool> login(String email, String password) async {
    // Simulate a network request
    if (email.isEmpty || password.isEmpty) {
      return false;
    }

    await Future.delayed(const Duration(seconds: 1));
    return true;
  }

  Future<bool> logout() async {
    // Simulate a network request
    await Future.delayed(const Duration(seconds: 1));
    return true;
  }

  Future<bool> register(String email, String password) async {
    // Simulate a network request
    await Future.delayed(const Duration(seconds: 1));
    return true;
  }
}
