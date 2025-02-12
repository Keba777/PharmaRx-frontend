import 'dart:convert';
import 'package:http/http.dart' as http;

abstract class AuthRemoteDataSource {
  Future<Map<String, dynamic>> registerUser(String firstName, String email, String phone, String role, String address);
  Future<void> loginUser(String email);
  Future<Map<String, dynamic>> verifyOTP(String email, String otp);
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final http.Client client;
  final String baseUrl;

  AuthRemoteDataSourceImpl({required this.client, required this.baseUrl});

  @override
  Future<Map<String, dynamic>> registerUser(String firstName, String email, String phone, String role, String address) async {
    final response = await client.post(
      Uri.parse('$baseUrl/users/register'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'firstName': firstName,
        'email': email,
        'phone': phone,
        'role': role,
        'address': address,
      }),
    );

    final responseBody = jsonDecode(response.body);
    print('Response status: ${response.statusCode}');
    print('Response body: $responseBody');

    if (response.statusCode != 201) {
      throw Exception(responseBody['message'] ?? 'Failed to register user');
    }

    return responseBody;
  }

  @override
  Future<void> loginUser(String email) async {
    final response = await client.post(
      Uri.parse('$baseUrl/users/login'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'email': email}),
    );

    final responseBody = jsonDecode(response.body);
    print('Response status: ${response.statusCode}');
    print('Response body: $responseBody');

    if (response.statusCode != 200) {
      throw Exception(responseBody['message'] ?? 'Failed to send OTP');
    }
  }

  @override
  Future<Map<String, dynamic>> verifyOTP(String email, String otp) async {
    final response = await client.post(
      Uri.parse('$baseUrl/users/verify-otp'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'email': email, 'otp': otp}),
    );

    final responseBody = jsonDecode(response.body);
    print('Response status: ${response.statusCode}');
    print('Response body: $responseBody');

    if (response.statusCode != 200) {
      throw Exception(responseBody['message'] ?? 'Failed to verify OTP');
    }
    return responseBody;
  }
}
