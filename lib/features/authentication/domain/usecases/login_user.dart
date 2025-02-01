import 'package:mobile/features/authentication/domain/repositories/auth_repository.dart';

class LoginUser {
  final AuthRepository repository;

  LoginUser(this.repository);

  Future<void> call(String email) async {
    await repository.loginUser(email);
  }
}
