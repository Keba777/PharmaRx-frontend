import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmarx/core/utils/images.dart';
import 'package:pinput/pinput.dart';
import 'package:pharmarx/core/routes/app_router.gr.dart';
import 'package:pharmarx/core/widget/buttons.dart';
import 'package:pharmarx/features/authentication/presentation/bloc/auth_bloc.dart';

@RoutePage()
class VerifyOTPScreen extends StatelessWidget {
  final String email;

  const VerifyOTPScreen({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    final TextEditingController otpController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Verify OTP'),
        centerTitle: true,
      ),
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is OTPVerified) {
            context.router.replace(const HomeRoute());
          } else if (state is AuthError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
                backgroundColor: Colors.red,
              ),
            );
          } else if (state is LoginOTPSent) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("OTP has been sent successfully!"),
                backgroundColor: Colors.green,
              ),
            );
          }
        },
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 12, bottom: 20),
                child: Image.asset(AppAssets.logo, width: 100, height: 100),
              ),
              const SizedBox(height: 16),
              Pinput(
                length: 6,
                controller: otpController,
                keyboardType: TextInputType.number,
                defaultPinTheme: PinTheme(
                  width: 50,
                  height: 50,
                  textStyle: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.grey),
                  ),
                ),
                focusedPinTheme: PinTheme(
                  width: 50,
                  height: 50,
                  textStyle: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.blue),
                  ),
                ),
                onCompleted: (otp) {
                  print("Entered OTP: $otp");
                },
              ),
              const SizedBox(height: 24),
              BlocBuilder<AuthBloc, AuthState>(
                builder: (context, state) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 28),
                    child: CustomMainButton(
                      onPressed: state is AuthLoading
                          ? () {}
                          : () {
                              final enteredOtp = otpController.text.trim();
                              if (enteredOtp.isEmpty || enteredOtp.length < 6) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content:
                                        Text("Please enter the 6-digit OTP."),
                                    backgroundColor: Colors.orange,
                                  ),
                                );
                                return;
                              }
                              context.read<AuthBloc>().add(
                                    VerifyOTPEvent(
                                      email: email,
                                      otp: enteredOtp.toString(),
                                    ),
                                  );
                            },
                      btnText:
                          state is AuthLoading ? 'Verifying...' : 'Verify OTP',
                    ),
                  );
                },
              ),
              const SizedBox(height: 16),
              BlocBuilder<AuthBloc, AuthState>(
                builder: (context, state) {
                  return CustomSecondaryTextButton(
                    btnText:
                        state is AuthLoading ? 'Resending...' : 'Resend OTP',
                    onPressed: state is AuthLoading
                        ? null
                        : () {
                            context.read<AuthBloc>().add(
                                  ResendOTPEvent(email: email),
                                );
                          },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
