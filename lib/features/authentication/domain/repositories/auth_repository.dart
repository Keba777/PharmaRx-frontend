abstract class AuthRepository {
  Future<void> registerUser(String firstName, String email, String phone, String role, String address);
  Future<void> loginUser(String email);
  Future<Map<String, dynamic>> verifyOTP(String email, String otp);
  Future<void> resendOTP(String email); 
}
