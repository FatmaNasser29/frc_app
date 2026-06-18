import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frc_app/config/routes/routes_name.dart';
import 'package:frc_app/config/utils/shared_widgets/custom_eleveted_button.dart';
import 'package:frc_app/config/utils/shared_widgets/custom_snack_bar.dart';
import 'package:frc_app/config/utils/shared_widgets/custom_text_button.dart';
import 'package:frc_app/config/utils/shared_widgets/custom_text_form_field.dart';
import 'package:frc_app/config/utils/shared_widgets/shared_gradient_background_widget.dart';
import 'package:frc_app/config/validator/app_validator.dart';
import 'package:frc_app/features/auth/sign_in/presentation/cubit/signin_cubit.dart';
import 'package:frc_app/features/auth/sign_in/presentation/cubit/signin_state.dart';

class SignInView extends StatefulWidget {
  const SignInView({super.key});

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    phoneController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthGradientBackground(
        title: 'Login to Your Account',
        child: Form(
          key: formKey,
          child: Column(
            children: [
              CustomTextFormField(
                controller: phoneController,
                label: 'Phone',
                hintText: '+20 11 5555 6600',
                validator: AppValidators.validatePhone,
                prefixIcon: Image.asset(
                  'assets/icons/envelope_icon.png',
                  width: 20,
                  height: 20,
                ),
              ),

              const SizedBox(height: 20),

              CustomTextFormField(
                controller: passwordController,
                label: 'Password',
                hintText: 'Password123',
                obscureText: true,
                validator: AppValidators.validatePassword,
                prefixIcon: Image.asset(
                  'assets/icons/lock_icon.png',
                  width: 20,
                  height: 20,
                ),
              ),

              const SizedBox(height: 6),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 46.5),
                child: Row(
                  children: [
                    const CustomTextButton(text: 'Remember me'),
                    const Spacer(),
                    CustomTextButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(
                          context,
                          RoutesName.forgetPassword,
                        );
                      },
                      text: 'Forgot password?',
                      fontWeight: FontWeight.bold,
                    ),
                  ],
                ),
              ),

              BlocConsumer<SigninCubit, SigninState>(
                listener: (context, state) {
                  if (state.status == SigninStatus.success) {
                    CustomSnackBar.showSuccess(
                      context,
                      state.message ?? 'Login Successful',
                    );

                    Navigator.pushReplacementNamed(context, RoutesName.home);
                  }

                  if (state.status == SigninStatus.error) {
                    CustomSnackBar.showError(
                      context,
                      state.errorMessage ?? 'Something went wrong',
                    );
                  }
                },
                builder: (context, state) {
                  return CustomElevatedButton(
                    text: state.status == SigninStatus.loading
                        ? 'Loading...'
                        : 'Sign In',
                    onPressed: () {
                      if (!formKey.currentState!.validate()) {
                        return;
                      }

                      context.read<SigninCubit>().signIn(
                        phone: phoneController.text.trim(),
                        password: passwordController.text.trim(),
                      );
                    },
                  );
                },
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 44),
                child: Row(
                  children: [
                    const CustomTextButton(text: "Don't have an account?"),
                    const Spacer(),
                    CustomTextButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(
                          context,
                          RoutesName.signUp,
                        );
                      },
                      text: 'Sign Up',
                      fontWeight: FontWeight.bold,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
