import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frc_app/config/routes/routes_name.dart';
import 'package:frc_app/config/theme/app_colors_pallet.dart';
import 'package:frc_app/config/theme/app_text_style.dart';
import 'package:frc_app/config/utils/shared_widgets/custom_eleveted_button.dart';
import 'package:frc_app/config/utils/shared_widgets/custom_snack_bar.dart';
import 'package:frc_app/config/utils/shared_widgets/custom_text_form_field.dart';
import 'package:frc_app/config/utils/shared_widgets/shared_gradient_background_widget.dart';
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
    return Scaffold(
      body: AuthGradientBackground(
        title: 'Forget Password',
        description:
            'Enter your phone number and a message will be sent to your WhatsApp account that include a link to change your password',
        descriptionStyle: AppTextStyle.internal().textStyle14.copyWith(
          color: AppColorsPallet.white,
        ),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              CustomTextFormField(
                controller: phoneController,
                label: 'Phone',
                hintText: '11 5555 6600',
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Phone number is required';
                  }

                  final phoneRegex = RegExp(r'^\+?[0-9]{10,15}$');

                  if (!phoneRegex.hasMatch(value.trim())) {
                    return 'Enter a valid phone number';
                  }

                  return null;
                },
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
                      state.message ?? 'OTP Sent Successfully',
                    );

                    Navigator.pushReplacementNamed(
                      context,
                      RoutesName.forgetPasswordOtpView,
                    );
                  }

                  if (state.status == ForgetPasswordStatus.error) {
                    CustomSnackBar.showError(
                      context,
                      state.errorMessage ?? 'Something went wrong',
                    );
                  }
                },
                builder: (context, state) {
                  return CustomElevatedButton(
                    text: state.status == ForgetPasswordStatus.loading
                        ? 'Loading...'
                        : 'Send',
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
