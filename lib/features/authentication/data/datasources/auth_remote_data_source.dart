import 'dart:convert';
import 'package:http/http.dart' as http;

abstract class AuthRemoteDataSource {
  Future<void> registerUser(String firstName, String email, String phone, String role, String address);
  Future<void> loginUser(String email);
  Future<Map<String, dynamic>> verifyOTP(String email, String otp);
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final http.Client client;
  final String baseUrl;

  AuthRemoteDataSourceImpl({required this.client, required this.baseUrl});

  @override
  Future<void> registerUser(String firstName, String email, String phone, String role, String address) async {
    final response = await client.post(
      Uri.parse('$baseUrl/auth/register'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'firstName': firstName,
        'email': email,
        'phone': phone,
        'role': role,
        'address': address,
      }),
    );
    if (response.statusCode != 201) {
      throw Exception('Failed to register user');
    }
  }

  @override
  Future<void> loginUser(String email) async {
    final response = await client.post(
      Uri.parse('$baseUrl/auth/login'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'email': email}),
    );
    if (response.statusCode != 200) {
      throw Exception('Failed to send OTP');
    }
  }

  @override
  Future<Map<String, dynamic>> verifyOTP(String email, String otp) async {
    final response = await client.post(
      Uri.parse('$baseUrl/auth/verify-otp'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'email': email, 'otp': otp}),
    );
    if (response.statusCode != 200) {
      throw Exception('Failed to verify OTP');
    }
    return jsonDecode(response.body);
  }
}
