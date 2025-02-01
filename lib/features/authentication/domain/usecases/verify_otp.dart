import 'package:mobile/features/authentication/domain/repositories/auth_repository.dart';

class VerifyOTP {
  final AuthRepository repository;

  VerifyOTP(this.repository);

  Future<Map<String, dynamic>> call(String email, String otp) async {
    return await repository.verifyOTP(email, otp);
  }
}
