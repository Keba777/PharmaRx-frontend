import 'package:mobile/features/authentication/domain/repositories/auth_repository.dart';

class RegisterUser {
  final AuthRepository repository;

  RegisterUser(this.repository);

  Future<void> call(String firstName, String email, String phone, String role, String address) async {
    await repository.registerUser(firstName, email, phone, role, address);
  }
}
