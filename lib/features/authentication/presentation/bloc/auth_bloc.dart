import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pharmarx/features/authentication/domain/repositories/auth_repository.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;

  AuthBloc({required this.authRepository}) : super(AuthInitial()) {
    on<RegisterUserEvent>((event, emit) async {
      try {
        emit(AuthLoading());
        await authRepository.registerUser(
          event.firstName,
          event.email,
          event.phone,
          event.role,
          event.address,
        );
        emit(RegisterSuccess());
      } catch (e) {
        emit(AuthError(message: e.toString()));
      }
    });

    on<LoginUserEvent>((event, emit) async {
      try {
        emit(AuthLoading());
        await authRepository.loginUser(event.email);
        emit(LoginOTPSent());
      } catch (e) {
        emit(AuthError(message: e.toString()));
      }
    });

    on<VerifyOTPEvent>((event, emit) async {
      try {
        emit(AuthLoading());
        final result = await authRepository.verifyOTP(event.email, event.otp);
        emit(OTPVerified(token: result['token'], user: result['user']));
      } catch (e) {
        emit(AuthError(message: e.toString()));
      }
    });
  }
}
