import 'package:email_validator/email_validator.dart';

class ValidatorsRegex {
  const ValidatorsRegex._();

  static bool isEmailValid(String email) {
    return EmailValidator.validate(email);
  }

  static bool isPasswordValid(String password) {
    return RegExp(r'^(?=.*[a-zA-Z])(?=.*\d).{8,}$').hasMatch(password);
  }

  static bool isPhoneNumberOnlyValid(String phoneNumber) {
    return RegExp(r'^[0-9]{7,15}$').hasMatch(phoneNumber);
  }

  static bool isNumeric(String value) {
    final numericRegex = RegExp(r'^[0-9]+$');
    return numericRegex.hasMatch(value);
  }

  static bool hasLowerCase(String password) {
    return RegExp(r'^(?=.*[a-z])').hasMatch(password);
  }

  static bool hasUpperCase(String password) {
    return RegExp(r'^(?=.*[A-Z])').hasMatch(password);
  }

  static bool hasNumber(String password) {
    return RegExp(r'^(?=.*?[0-9])').hasMatch(password);
  }

  static bool hasSpecialCharacter(String password) {
    return RegExp(r'^(?=.*?[#?!@$%^&*-])').hasMatch(password);
  }

  static bool hasMinLength(String password) {
    return RegExp(r'^(?=.{8,})').hasMatch(password);
  }

  static bool isEnglishText(String text) {
    final englishRegex = RegExp(r'^[\x00-\x7F]+$');
    return englishRegex.hasMatch(text);
  }
}
