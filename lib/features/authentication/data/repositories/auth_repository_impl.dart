import 'package:mobile/features/authentication/data/datasources/auth_remote_data_source.dart';
import 'package:mobile/features/authentication/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl({required this.remoteDataSource});

  @override
  Future<void> registerUser(String firstName, String email, String phone, String role, String address) async {
    await remoteDataSource.registerUser(firstName, email, phone, role, address);
  }

  @override
  Future<void> loginUser(String email) async {
    await remoteDataSource.loginUser(email);
  }

  @override
  Future<Map<String, dynamic>> verifyOTP(String email, String otp) async {
    return await remoteDataSource.verifyOTP(email, otp);
  }
}
