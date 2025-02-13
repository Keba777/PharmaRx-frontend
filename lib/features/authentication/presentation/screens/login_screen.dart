import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmarx/core/routes/app_router.gr.dart';
import 'package:pharmarx/core/theme/typography.dart';
import 'package:pharmarx/core/utils/images.dart';
import 'package:pharmarx/core/widget/buttons.dart';
import 'package:pharmarx/core/widget/text_field.dart';
import 'package:pharmarx/features/authentication/presentation/bloc/auth_bloc.dart';

@RoutePage()
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is LoginOTPSent) {
            context.router.push(VerifyOTPRoute());
          }
        },
        builder: (context, state) {
          bool isLoading = state is AuthLoading;
          String? errorMessage;
          if (state is AuthError) {
            errorMessage = state.message;
          }

          return SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 12, bottom: 20),
                  child: Image.asset(AppAssets.logo, width: 100, height: 100),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 45, left: 24, right: 24),
                  child: Text(
                    'Enter your email address, and we\'ll send you a one-time password (OTP).',
                    style: TextStyles.formSubheading,
                    textAlign: TextAlign.center, 
                  ),
                ),
                CustomTextField(
                  controller: emailController,
                  labelText: 'Email',
                  keyboardType: TextInputType.emailAddress,
                  prefixIcon: Icons.email,
                ),
                const SizedBox(height: 16),
                if (errorMessage != null)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Text(
                      errorMessage,
                      style: const TextStyle(color: Colors.red),
                    ),
                  ),
                Padding(
                  padding: const EdgeInsets.only(top: 28),
                  child: CustomMainButton(
                    onPressed: isLoading
                        ? () {}
                        : () {
                            context.read<AuthBloc>().add(
                                  LoginUserEvent(email: emailController.text),
                                );
                          },
                    btnText: isLoading ? 'Sending...' : 'Send OTP',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Don\'t have an account?'),
                      CustomTextButton(
                        btnText: 'Register',
                        routeName: RegisterRoute(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
