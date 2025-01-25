import 'package:flutter/material.dart';
import 'package:papa_entulho/domain/repositories/auth_repository.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: Center(
          child: InkWell(
        onTap: () {
          print('teste');
          AuthRepository().login(email: 'teste@gmail.com', password: '123456');
        },
        child: const Text('teste'),
      )),
    );
  }
}
