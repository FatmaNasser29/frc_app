import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frc_app/config/l10n/failure_localizer.dart';
import 'package:frc_app/config/l10n/l10n_extension.dart';
import 'package:frc_app/config/routes/routes_name.dart';
import 'package:frc_app/config/theme/app_theme.dart';
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
    final l10n = context.l10n;

    return Scaffold(
      body: AuthGradientBackground(
        title: l10n.loginToYourAccount,
        child: Form(
          key: formKey,
          child: Column(
            children: [
              CustomTextFormField(
                controller: phoneController,
                label: l10n.phone,
                hintText: l10n.phoneHint,
                keyboardType: TextInputType.phone,
                validator: (value) => AppValidators.validatePhone(value, l10n),
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
                    dialogBackgroundColor: context.colors.white,
                    dialogTextStyle: context.textStyle.textStyle14.copyWith(
                      color: context.colors.assentsBlack,
                    ),
                    searchStyle: context.textStyle.textStyle14.copyWith(
                      color: context.colors.assentsBlack,
                    ),
                    searchDecoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.search,
                        color: context.colors.assentsGray,
                      ),
                      hintStyle: context.textStyle.textStyle14.copyWith(
                        color: context.colors.assentsGray,
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: context.colors.backgroundSecondary,
                        ),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: context.colors.assentsPurple,
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              CustomTextFormField(
                controller: passwordController,
                label: l10n.password,
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

              const SizedBox(height: 6),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 46.5),
                child: Row(
                  children: [
                    CustomTextButton(text: l10n.rememberMe),
                    const Spacer(),
                    CustomTextButton(
                      onPressed: () {
                    Navigator.pushNamed(
                      context,
                      RoutesName.forgetPassword,
                    );
                      },
                      text: l10n.forgetPasswordQuestion,
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
                      state.message ?? l10n.loginSuccessful,
                    );

                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      RoutesName.home,
                      (route) => false,
                    );
                  }

                  if (state.status == SigninStatus.error) {
                    CustomSnackBar.showError(
                      context,
                      FailureLocalizer.localize(l10n, state.errorMessage),
                    );
                  }
                },
                builder: (context, state) {
                  return CustomElevatedButton(
                    text: state.status == SigninStatus.loading
                        ? l10n.loading
                        : l10n.signIn,
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
                    CustomTextButton(text: l10n.dontHaveAccount),
                    const Spacer(),
                    CustomTextButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(
                          context,
                          RoutesName.signUp,
                        );
                      },
                      text: l10n.signUp,
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
