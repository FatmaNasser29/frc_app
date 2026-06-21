import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frc_app/config/l10n/failure_localizer.dart';
import 'package:frc_app/config/l10n/l10n_extension.dart';
import 'package:frc_app/config/routes/routes_name.dart';
import 'package:frc_app/config/theme/app_theme.dart';
import 'package:frc_app/config/utils/shared_widgets/custom_eleveted_button.dart';
import 'package:frc_app/config/utils/shared_widgets/custom_snack_bar.dart';
import 'package:frc_app/config/utils/shared_widgets/custom_text_form_field.dart';
import 'package:frc_app/config/utils/shared_widgets/shared_gradient_background_widget.dart';
import 'package:frc_app/config/validator/app_validator.dart';
import 'package:frc_app/features/auth/forget_password/presentation/cubit/forget_password_cubit.dart';
import 'package:frc_app/features/auth/forget_password/presentation/cubit/forget_password_state.dart';

class ForgetPasswordView extends StatefulWidget {
  const ForgetPasswordView({super.key});

  @override
  State<ForgetPasswordView> createState() => _ForgetPasswordViewState();
}

class _ForgetPasswordViewState extends State<ForgetPasswordView> {
  final phoneController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  String selectedCountryCode = '+20';

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Scaffold(
      body: AuthGradientBackground(
        title: l10n.forgetPassword,
        description: l10n.forgetPasswordDescription,
        descriptionStyle: context.textStyle.textStyle14.copyWith(
          color: Colors.white,
        ),
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
                  ),
                ),
              ),
              const SizedBox(height: 40),

              BlocConsumer<ForgetPasswordCubit, ForgetPasswordState>(
                listener: (context, state) {
                  if (state.status == ForgetPasswordStatus.success) {
                    CustomSnackBar.showSuccess(
                      context,
                      state.message ?? l10n.otpSentSuccessfully,
                    );

                    Navigator.pushNamed(
                      context,
                      RoutesName.forgetPasswordOtpView,
                      arguments:
                          '$selectedCountryCode${phoneController.text.trim()}',
                    );
                  }

                  if (state.status == ForgetPasswordStatus.error) {
                    CustomSnackBar.showError(
                      context,
                      FailureLocalizer.localize(l10n, state.errorMessage),
                    );
                  }
                },
                builder: (context, state) {
                  return CustomElevatedButton(
                    text: state.status == ForgetPasswordStatus.loading
                        ? l10n.loading
                        : l10n.send,
                    onPressed: () {
                      if (!formKey.currentState!.validate()) {
                        return;
                      }

                      context.read<ForgetPasswordCubit>().sendOtp(
                        phone:
                            '$selectedCountryCode${phoneController.text.trim()}',
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
