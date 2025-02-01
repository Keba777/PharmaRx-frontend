import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<RegisterUserEvent>((event, emit) async {
      try {
        emit(AuthLoading());
        // Call register user use case here.
        emit(RegisterSuccess());
      } catch (e) {
        emit(AuthError(message: e.toString()));
      }
    });

    on<LoginUserEvent>((event, emit) async {
      try {
        emit(AuthLoading());
        // Call login user use case here.
        emit(LoginOTPSent());
      } catch (e) {
        emit(AuthError(message: e.toString()));
      }
    });

    on<VerifyOTPEvent>((event, emit) async {
      try {
        emit(AuthLoading());
        // Call verify OTP use case here.
        emit(OTPVerified(token: "sample_token", user: {})); // Replace with actual data.
      } catch (e) {
        emit(AuthError(message: e.toString()));
      }
    });
  }
}
