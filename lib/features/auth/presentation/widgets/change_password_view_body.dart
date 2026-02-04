import 'package:flutter/widgets.dart';
import 'package:flux_store/core/helpers/app_constants.dart';
import 'package:flux_store/core/helpers/spacing.dart';
import 'package:flux_store/core/helpers/validators_regex.dart';
import 'package:flux_store/core/widgets/custom_back_app_bar.dart';
import 'package:flux_store/core/widgets/custom_text_button.dart';
import 'package:flux_store/core/widgets/custom_text_form_field.dart';
import 'package:flux_store/generated/l10n.dart';

class ChangePasswordViewBody extends StatefulWidget {
  const ChangePasswordViewBody({super.key});

  @override
  State<ChangePasswordViewBody> createState() => _ChangePasswordViewBodyState();
}

class _ChangePasswordViewBodyState extends State<ChangePasswordViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  late String password, confirmPassword;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: AppConstants.paddingHorizontal),
      child: Form(
        key: formKey,
        autovalidateMode: autovalidateMode,
        child: Column(
          children: [
            CustomBackAppBar(title: S.of(context).change_password),
            vGap(50),
            CustomTextFormField(
              onChanged: (value) {
                password = value!;
              },
              hintText: S.of(context).password,
              textInputType: TextInputType.visiblePassword,
              validator: (p0) {
                if (p0 == null || p0.isEmpty) {
                  return S.of(context).requiredField;
                } else if (!ValidatorsRegex.isPasswordValid(password)) {
                  return S.of(context).passwordRequirements;
                }
                return null;
              },
            ),
            vGap(10),
            CustomTextFormField(
              onChanged: (value) {
                confirmPassword = value!;
              },
              hintText: S.of(context).confirm_password,
              textInputType: TextInputType.visiblePassword,
              validator: (p0) {
                if (p0 == null || p0.isEmpty) {
                  return S.of(context).requiredField;
                } else if (p0 != password) {
                  return S.of(context).confirm_password_validation;
                }
                return null;
              },
            ),
            vGap(20),
            CustomTextButton(
              text: S.of(context).next,
              onTap: () {
                if (formKey.currentState!.validate()) {
                  formKey.currentState!.save();
                } else {
                  setState(() {
                    autovalidateMode = AutovalidateMode.always;
                  });
                }
              },
            ),
            // Add your phone number input field and other widgets here
          ],
        ),
      ),
    );
  }
}
