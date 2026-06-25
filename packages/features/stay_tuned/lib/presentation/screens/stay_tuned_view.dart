import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:localization/localization.dart';
import 'package:design_system/design_system.dart';
import 'package:core/core.dart';
import '../cubit/stay_tuned_cubit.dart';

class StayTunedView extends StatefulWidget {
  const StayTunedView({super.key});

  @override
  State<StayTunedView> createState() => _StayTunedViewState();
}

class _StayTunedViewState extends State<StayTunedView> {
  final _phoneController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String _selectedCountryCode = '+20';

  @override
  void dispose() {
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Scaffold(
      body: AuthGradientBackground(
        title: l10n.stayTuned,
        titleStyle: context.textStyle.textStyle40.copyWith(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
        subtitle: l10n.fashionAndBeauty,
        description: l10n.stayTunedDescription,

        footerText: l10n.stayTunedFooter,
        footerStyle: context.textStyle.textStyle16.copyWith(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),

        descriptionStyle: context.textStyle.textStyle14.copyWith(
          color: Colors.white,
        ),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              CustomTextFormField(
                controller: _phoneController,
                label: l10n.phone,
                hintText: l10n.phoneHint,
                keyboardType: TextInputType.phone,
                validator: (value) => AppValidators.validatePhone(
                  value,
                  l10n,
                  countryCode: _selectedCountryCode,
                ),
                prefixIconConstraints: const BoxConstraints(
                  minWidth: 95,
                  minHeight: 24,
                ),
                prefixIcon: SizedBox(
                  width: 90,
                  child: CountryCodePicker(
                    onChanged: (country) {
                      _selectedCountryCode = country.dialCode ?? '+20';
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

              BlocConsumer<StayTunedCubit, StayTunedState>(
                listener: (context, state) {
                  if (state.status == StayTunedStatus.success) {
                    CustomSnackBar.showSuccess(
                      context,
                      state.message ?? l10n.stayTunedSuccess,
                    );
                    _phoneController.clear();
                    context.read<StayTunedCubit>().reset();
                  }

                  if (state.status == StayTunedStatus.error) {
                    CustomSnackBar.showError(
                      context,
                      state.errorMessage ?? l10n.somethingWentWrong,
                    );
                  }
                },
                builder: (context, state) {
                  return CustomElevatedButton(
                    text: state.status == StayTunedStatus.loading
                        ? l10n.loading
                        : l10n.submit,
                    onPressed: () {
                      if (!_formKey.currentState!.validate()) return;

                      context.read<StayTunedCubit>().submit(
                        contact: AppValidators.normalizePhone(
                          _selectedCountryCode,
                          _phoneController.text,
                        ),
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
