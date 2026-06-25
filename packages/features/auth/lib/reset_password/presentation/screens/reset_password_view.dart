import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:networking/networking.dart';
import 'package:localization/localization.dart';
import 'package:design_system/design_system.dart';
import 'package:design_system/design_system.dart';
import 'package:design_system/design_system.dart';
import 'package:design_system/design_system.dart';
import 'package:core/core.dart';
import 'package:auth/reset_password/presentation/cubit/reset_password_cubit.dart';
import 'package:auth/reset_password/presentation/cubit/reset_password_state.dart';

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
    final l10n = context.l10n;
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    final String phoneNumber = args['phoneNumber'];

    final String otp = args['otp'];

    void navigateToSignIn() {
      bool hasSignIn = false;
      Navigator.of(context).popUntil((route) {
        if (route.settings.name == 'signIn') {
          hasSignIn = true;
          return true;
        }
        return false;
      });
      if (!hasSignIn) {
        Navigator.pushNamedAndRemoveUntil(
          context,
          'signIn',
          (route) => false,
        );
      }
    }

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) return;
        navigateToSignIn();
      },
      child: Scaffold(
        body: AuthGradientBackground(
          title: l10n.setNewPassword,
          description: l10n.setNewPasswordDescription,
          onBackPressed: navigateToSignIn,
          child: Form(
          key: formKey,
          child: Column(
            children: [
              CustomTextFormField(
                controller: passwordController,
                label: l10n.newPassword,
                hintText: l10n.passwordHint,
                obscureText: true,
                validator: (value) =>
                    AppValidators.validatePassword(value, l10n),
                prefixIcon: Image.asset(
                  'assets/icons/lock_icon.png',
                  width: 20,
                  height: 20,
                ),
              ),

              const SizedBox(height: 20),

              CustomTextFormField(
                controller: confirmPasswordController,
                label: l10n.confirmNewPassword,
                hintText: l10n.passwordHint,
                obscureText: true,
                validator: (value) => AppValidators.validateConfirmPassword(
                  value,
                  passwordController.text,
                  l10n,
                ),
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
                      state.message ?? l10n.passwordResetSuccessfully,
                    );

                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      'signIn',
                      (route) => false,
                    );
                  }

                  if (state.status == ResetPasswordStatus.error) {
                    CustomSnackBar.showError(
                      context,
                      FailureLocalizer.localize(l10n, state.errorMessage),
                    );
                  }
                },
                builder: (context, state) {
                  return CustomElevatedButton(
                    text: state.status == ResetPasswordStatus.loading
                        ? l10n.loading
                        : l10n.submit,
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
    ),
  );
}
}
