import 'package:flutter_test/flutter_test.dart';
import 'package:papa_entulho/domain/repositories/auth_repository.dart';

void main() {
  group('AuthRepository Tests', () {
    final authRepository = AuthRepository();

    test('should return true when login is successful', () async {
      final result = await authRepository.login('test@example.com', 'password123');
      expect(result, true);
    });

    test('should return false when login fails', () async {
      final result = await authRepository.login('wrong@example.com', '');
      expect(result, false);
    });

    test('should return true when logout is successful', () async {
      final result = await authRepository.logout();
      expect(result, true);
    });
  });
}
