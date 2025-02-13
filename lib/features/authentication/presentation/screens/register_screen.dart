import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmarx/core/routes/app_router.gr.dart';
import 'package:pharmarx/core/utils/images.dart';
import 'package:pharmarx/core/widget/buttons.dart';
import 'package:pharmarx/core/widget/text_field.dart';
import 'package:pharmarx/features/authentication/presentation/bloc/auth_bloc.dart';

@RoutePage()
class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController firstNameController = TextEditingController();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController phoneController = TextEditingController();
    final TextEditingController roleController = TextEditingController();
    final TextEditingController addressController = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text('Register')),
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is RegisterSuccess) {
            context.router.push(LoginRoute());
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
                  padding: EdgeInsets.only( top: 12, bottom: 20),
                  child: Image.asset(AppAssets.logo, width: 100, height: 100),
                ),
                const SizedBox(height: 16),
                CustomTextField(
                  controller: firstNameController,
                  labelText: 'First Name',
                  keyboardType: TextInputType.name,
                  prefixIcon: Icons.person,
                ),
                CustomTextField(
                  controller: emailController,
                  labelText: 'Email',
                  keyboardType: TextInputType.emailAddress,
                  prefixIcon: Icons.email,
                ),
                CustomTextField(
                  controller: phoneController,
                  labelText: 'Phone',
                  keyboardType: TextInputType.phone,
                  prefixIcon: Icons.phone,
                ),
                CustomTextField(
                  controller: roleController,
                  labelText: 'Role',
                  keyboardType: TextInputType.text,
                  prefixIcon: Icons.work,
                ),
                CustomTextField(
                  controller: addressController,
                  labelText: 'Address',
                  keyboardType: TextInputType.streetAddress,
                  prefixIcon: Icons.location_on,
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
                                  RegisterUserEvent(
                                    firstName: firstNameController.text,
                                    email: emailController.text,
                                    phone: phoneController.text,
                                    role: roleController.text,
                                    address: addressController.text,
                                  ),
                                );
                          },
                    btnText: isLoading ? 'Registering...' : 'Register',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Already have an account?'),
                      CustomTextButton(
                        btnText: ' Login',
                        routeName: LoginRoute(),
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
