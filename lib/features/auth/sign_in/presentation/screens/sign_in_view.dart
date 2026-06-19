import 'package:country_code_picker/country_code_picker.dart';
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
  String selectedCountryCode = '+20';

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
                hintText: '11 5555 6600',
                keyboardType: TextInputType.phone,
                validator: AppValidators.validatePhone,
                prefixIconConstraints: const BoxConstraints(
                  minWidth: 95,
                  minHeight: 24,
                ),
                prefixIcon: SizedBox(
                  width: 90,
                  child: CountryCodePicker(
                    onChanged: (country) {
                      selectedCountryCode = country.dialCode ?? '+20';
                    },
                    initialSelection: 'EG',
                    favorite: const ['+20', 'EG'],
                    showCountryOnly: false,
                    showOnlyCountryWhenClosed: false,
                    alignLeft: false,
                    padding: EdgeInsets.zero,
                    textStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
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

                    Navigator.pushNamed(
                      context,
                      RoutesName.signInOtpView,
                      arguments:
                          '$selectedCountryCode${phoneController.text.trim()}',
                    );
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
                        phone:
                            '$selectedCountryCode${phoneController.text.trim()}',
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
