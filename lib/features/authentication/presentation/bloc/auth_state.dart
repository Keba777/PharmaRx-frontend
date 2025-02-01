part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object?> get props => [];
}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class RegisterSuccess extends AuthState {}

class LoginOTPSent extends AuthState {}

class OTPVerified extends AuthState {
  final String token;
  final Map<String, dynamic> user;

  const OTPVerified({required this.token, required this.user});

  @override
  List<Object?> get props => [token, user];
}

class AuthError extends AuthState {
  final String message;

  const AuthError({required this.message});

  @override
  List<Object?> get props => [message];
}
