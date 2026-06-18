import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frc_app/config/utils/shared_widgets/custom_eleveted_button.dart';
import 'package:frc_app/config/utils/shared_widgets/custom_text_form_field.dart';
import 'package:frc_app/config/utils/shared_widgets/shared_gradient_background_widget.dart';
import 'package:frc_app/features/auth/sign_up/presentation/cubit/signup_cubit.dart';
import 'package:frc_app/features/auth/sign_up/presentation/cubit/signup_states.dart';

class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthGradientBackground(
        title: 'Create Your Account',
        child: Column(
          children: [
            CustomTextFormField(
              controller: nameController,
              label: 'Full Name',
              hintText: 'Ahmed Aly Najiub',
              prefixIcon: Image.asset(
                'assets/icons/person_icon.png',
                width: 20,
                height: 20,
              ),
              backgroundColor: Colors.white,
              borderColor: Colors.transparent,
              textColor: Colors.black54,
            ),

            const SizedBox(height: 12),

            CustomTextFormField(
              controller: phoneController,
              label: 'Phone',
              hintText: '+20 11 5555 6600',
              prefixIcon: Image.asset(
                'assets/icons/envelope_icon.png',
                width: 20,
                height: 20,
              ),
            ),

            const SizedBox(height: 12),

            CustomTextFormField(
              controller: passwordController,
              label: 'Password',
              hintText: 'Password123',
              prefixIcon: Image.asset(
                'assets/icons/lock_icon.png',
                width: 20,
                height: 20,
              ),
              obscureText: true,
            ),

            const SizedBox(height: 40),

            BlocConsumer<SignupCubit, SignupState>(
              listener: (context, state) {
                if (state.status == SignupStatus.success) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(state.message ?? 'OTP sent successfully'),
                    ),
                  );
                }

                if (state.status == SignupStatus.error) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        state.errorMessage ?? 'Something went wrong',
                      ),
                    ),
                  );
                }
              },
              builder: (context, state) {
                return CustomElevatedButton(
                  text: state.status == SignupStatus.loading
                      ? 'Loading...'
                      : 'Sign Up',
                  onPressed: state.status == SignupStatus.loading
                      ? () {}
                      : () {
                          debugPrint('Sign Up Clicked');

                          if (nameController.text.trim().isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Please enter your full name'),
                              ),
                            );
                            return;
                          }

                          if (phoneController.text.trim().isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Please enter your phone number'),
                              ),
                            );
                            return;
                          }

                          if (passwordController.text.trim().isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Please enter your password'),
                              ),
                            );
                            return;
                          }

                          context.read<SignupCubit>().register(
                            fullName: nameController.text.trim(),
                            phone: phoneController.text.trim(),
                            password: passwordController.text.trim(),
                          );
                        },
                );
              },
            ),

            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Have an account?',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Sign In',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
