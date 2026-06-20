import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frc_app/config/routes/routes_name.dart';
import 'package:frc_app/config/utils/shared_widgets/custom_eleveted_button.dart';
import 'package:frc_app/config/utils/shared_widgets/custom_snack_bar.dart';
import 'package:frc_app/config/utils/shared_widgets/custom_text_form_field.dart';
import 'package:frc_app/config/utils/shared_widgets/shared_gradient_background_widget.dart';
import 'package:frc_app/features/auth/reset_password/presentation/cubit/reset_password_cubit.dart';
import 'package:frc_app/features/auth/reset_password/presentation/cubit/reset_password_state.dart';

class ResetPasswordView extends StatefulWidget {
  const ResetPasswordView({super.key});

  @override
  State<ResetPasswordView> createState() => _ResetPasswordViewState();
}

class _ResetPasswordViewState extends State<ResetPasswordView> {
  final passwordController = TextEditingController();

  final confirmPasswordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    final String phoneNumber = args['phoneNumber'];

    final String otp = args['otp'];
    return Scaffold(
      body: AuthGradientBackground(
        title: 'Set New Password',
        description:
            'Enter your new password and confirm to set the new password to your account',
        child: Form(
          key: formKey,
          child: Column(
            children: [
              CustomTextFormField(
                controller: passwordController,
                label: 'New Password',
                hintText: 'Password123',
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Password is required';
                  }
                  return null;
                },
                prefixIcon: Image.asset(
                  'assets/icons/lock_icon.png',
                  width: 20,
                  height: 20,
                ),
              ),

              const SizedBox(height: 20),

              CustomTextFormField(
                controller: confirmPasswordController,
                label: 'Confirm New Password',
                hintText: 'Password123',
                obscureText: true,
                validator: (value) {
                  if (value != passwordController.text) {
                    return 'Passwords do not match';
                  }
                  return null;
                },
                prefixIcon: Image.asset(
                  'assets/icons/lock_icon.png',
                  width: 20,
                  height: 20,
                ),
              ),

              const SizedBox(height: 40),

              BlocConsumer<ResetPasswordCubit, ResetPasswordState>(
                listener: (context, state) {
                  if (state.status == ResetPasswordStatus.success) {
                    CustomSnackBar.showSuccess(
                      context,
                      state.message ?? 'Password reset successfully',
                    );

                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      RoutesName.signIn,
                      (route) => false,
                    );
                  }

                  if (state.status == ResetPasswordStatus.error) {
                    CustomSnackBar.showError(
                      context,
                      state.errorMessage ?? 'Something went wrong',
                    );
                  }
                },
                builder: (context, state) {
                  return CustomElevatedButton(
                    text: state.status == ResetPasswordStatus.loading
                        ? 'Loading...'
                        : 'Submit',
                    onPressed: () {
                      if (!formKey.currentState!.validate()) {
                        return;
                      }

                      context.read<ResetPasswordCubit>().resetPassword(
                        phoneNumber: phoneNumber,
                        otp: otp,
                        password: passwordController.text.trim(),
                        confirmPassword: confirmPasswordController.text.trim(),
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
