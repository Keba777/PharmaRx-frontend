part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object?> get props => [];
}

class RegisterUserEvent extends AuthEvent {
  final String firstName;
  final String email;
  final String phone;
  final String role;
  final String address;

  const RegisterUserEvent({required this.firstName, required this.email, required this.phone, required this.role, required this.address});

  @override
  List<Object?> get props => [firstName, email, phone, role, address];
}

class LoginUserEvent extends AuthEvent {
  final String email;

  const LoginUserEvent({required this.email});

  @override
  List<Object?> get props => [email];
}

class VerifyOTPEvent extends AuthEvent {
  final String email;
  final String otp;

  const VerifyOTPEvent({required this.email, required this.otp});

  @override
  List<Object?> get props => [email, otp];
}
