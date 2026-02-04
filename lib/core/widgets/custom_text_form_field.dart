import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flux_store/core/theme/app_text_styles.dart';
import '../../generated/l10n.dart';
import '../theme/app_colors.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({
    super.key,
    this.hintText,
    required this.textInputType,
    required this.validator,
    this.icon,
    this.initialValue,
    this.maxLines,
    this.onChanged,
    this.minLines,
    this.controller,
    this.labelText,
    this.inputFormatters,
    this.hintWidget,
    this.onSaved,
    this.isObscureText,
  });
  final String? labelText;
  final int? maxLines;
  final IconData? icon;
  final String? hintText;
  final int? minLines;
  final TextInputType textInputType;
  final String? Function(String?)? validator;
  final void Function(String?)? onChanged;
  final String? initialValue;
  final TextEditingController? controller;
  final List<TextInputFormatter>? inputFormatters;
  final Widget? hintWidget;
  final void Function(String?)? onSaved;
  final bool? isObscureText;
  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  late bool _isObscured;
  late bool? showFields = false;

  @override
  void initState() {
    super.initState();
    _isObscured =
        widget.isObscureText ??
        widget.textInputType == TextInputType.visiblePassword;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      initialValue: widget.initialValue,
      obscureText: _isObscured,
      inputFormatters: widget.inputFormatters,
      onChanged: widget.onChanged,
      onSaved: widget.onSaved,
      cursorColor: AppColors.primary,
      maxLines: widget.maxLines ?? 1,
      minLines: widget.minLines ?? 1,
      keyboardType: widget.textInputType,
      textAlign: TextAlign.start,
      style: AppTextStyles.font16BlackMedium,

      validator:
          widget.validator ??
          (value) {
            if (value == null || value.isEmpty) {
              return S.of(context).requiredField;
            }
            return null;
          },

      decoration: InputDecoration(
        labelText: widget.labelText,
        hintText: widget.hintText,
        suffixIcon: _buildSuffixIcon(),
      ),
    );
  }

  Widget? _buildSuffixIcon() {
    if (widget.icon != null) {
      return Icon(widget.icon, color: AppColors.grey);
    } else if (widget.textInputType == TextInputType.emailAddress) {
      return Icon(Icons.email_outlined, color: AppColors.grey);
    } else if (widget.textInputType == TextInputType.visiblePassword) {
      return GestureDetector(
        onTap: () {
          setState(() {
            _isObscured = !_isObscured;
          });
        },
        child: Icon(
          _isObscured ? Icons.visibility_off : Icons.visibility,
          color: AppColors.grey,
        ),
      );
    }
    return null;
  }
}
