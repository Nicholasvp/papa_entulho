import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:papa_entulho/domain/repositories/auth_repository.dart';
import 'package:papa_entulho/firebase_options.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('AuthRepository Tests', () {
    late AuthRepository authRepository;

    // Inicializa o Firebase antes de rodar qualquer teste
    setUpAll(() async {
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );
      authRepository = AuthRepository();
    });

    test('should return true when login is successful', () async {
      final result = await authRepository.login(email: 'test@example.com', password: 'password123');
      expect(result, true);
    });

    test('should return false when login fails', () async {
      final result = await authRepository.login(email: 'wrong@example.com', password: '');
      expect(result, false);
    });

    test('should return true when logout is successful', () async {
      final result = await authRepository.logout();
      expect(result, true);
    });

    test('should return true when register is successful', () async {
      final result = await authRepository.register(email: 'teste@email.com', password: '12345678');
      expect(result, true);
    });
  });
}
