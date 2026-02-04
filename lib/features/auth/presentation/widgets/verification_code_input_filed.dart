import 'package:flutter/material.dart';
import '../../../../core/helpers/validators_regex.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../generated/l10n.dart';

class VerificationCodeInputField extends StatefulWidget {
  const VerificationCodeInputField({
    super.key,
    required this.onCompleted,
    this.length = 4,
  });

  final Function(String code) onCompleted;
  final int length;

  @override
  State<VerificationCodeInputField> createState() =>
      _VerificationCodeInputFieldState();
}

class _VerificationCodeInputFieldState
    extends State<VerificationCodeInputField> {
  late List<TextEditingController> controllers;
  late List<FocusNode> focusNodes;

  @override
  void initState() {
    super.initState();
    controllers = List.generate(widget.length, (_) => TextEditingController());
    focusNodes = List.generate(widget.length, (_) => FocusNode());
  }

  @override
  void dispose() {
    for (var c in controllers) {
      c.dispose();
    }
    for (var f in focusNodes) {
      f.dispose();
    }
    super.dispose();
  }

  void _onChanged(String value, int index) {
    if (value.isNotEmpty && index < widget.length - 1) {
      FocusScope.of(context).requestFocus(focusNodes[index + 1]);
    }

    if (value.isEmpty && index > 0) {
      FocusScope.of(context).requestFocus(focusNodes[index - 1]);
    }

    String code = controllers.map((c) => c.text).join();
    if (code.length == widget.length) {
      widget.onCompleted(code);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(widget.length, (index) {
        return Expanded(
          child: Container(
            height: 48,
            margin: const EdgeInsets.symmetric(horizontal: 6),
            child: TextFormField(
              controller: controllers[index],
              focusNode: focusNodes[index],
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              maxLength: 1,
              style: AppTextStyles.font16BlackMedium,
              decoration: InputDecoration(
                counterText: "",
                contentPadding: EdgeInsets.zero,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                  borderSide: BorderSide(color: AppColors.primary),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                  borderSide: BorderSide(color: AppColors.primary),
                ),
              ),
              onChanged: (value) => _onChanged(value, index),
              validator: (value) {
                String code = controllers.map((c) => c.text).join();
                if (code.length != widget.length ||
                    !ValidatorsRegex.isNumeric(code)) {
                  return S.of(context).invalidVerificationCode;
                }
                return null;
              },
            ),
          ),
        );
      }),
    );
  }
}
