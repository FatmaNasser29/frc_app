import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frc_app/config/routes/routes_name.dart';
import 'package:frc_app/config/utils/shared_widgets/custom_eleveted_button.dart';
import 'package:frc_app/config/utils/shared_widgets/custom_snack_bar.dart';
import 'package:frc_app/config/utils/shared_widgets/custom_text_form_field.dart';
import 'package:frc_app/config/utils/shared_widgets/shared_gradient_background_widget.dart';
import 'package:frc_app/config/validator/app_validator.dart';
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

  final _formKey = GlobalKey<FormState>();

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
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              CustomTextFormField(
                controller: nameController,
                label: 'Full Name',
                hintText: 'Ahmed Aly Najiub',
                validator: AppValidators.validateFullName,
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
                validator: AppValidators.validatePhone,
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
                obscureText: true,
                validator: AppValidators.validatePassword,
                prefixIcon: Image.asset(
                  'assets/icons/lock_icon.png',
                  width: 20,
                  height: 20,
                ),
              ),

              const SizedBox(height: 20),
              BlocConsumer<SignupCubit, SignupState>(
                listener: (context, state) {
                  if (state.status == SignupStatus.success) {
                    CustomSnackBar.showSuccess(
                      context,
                      state.message ?? 'OTP sent to your WhatsApp',
                    );

                    Navigator.pushNamed(
                      context,
                      RoutesName.signUpOtpView,
                      arguments: phoneController.text.trim(),
                    );
                  }

                  if (state.status == SignupStatus.error) {
                    CustomSnackBar.showError(
                      context,
                      state.errorMessage ?? 'Something went wrong',
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
                            if (!_formKey.currentState!.validate()) {
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
                padding: const EdgeInsets.only(left: 40, right: 40),
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
      ),
    );
  }
}
