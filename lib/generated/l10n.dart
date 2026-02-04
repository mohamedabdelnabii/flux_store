// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Cart`
  String get cart {
    return Intl.message(
      'Cart',
      name: 'cart',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message(
      'Settings',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `This field is required`
  String get requiredField {
    return Intl.message(
      'This field is required',
      name: 'requiredField',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `LOG IN`
  String get login {
    return Intl.message(
      'LOG IN',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `SIGN UP`
  String get sign_up {
    return Intl.message(
      'SIGN UP',
      name: 'sign_up',
      desc: '',
      args: [],
    );
  }

  /// `Register`
  String get register {
    return Intl.message(
      'Register',
      name: 'register',
      desc: '',
      args: [],
    );
  }

  /// `Forgot Password?`
  String get forgotPassword {
    return Intl.message(
      'Forgot Password?',
      name: 'forgotPassword',
      desc: '',
      args: [],
    );
  }

  /// `Don't have an account?`
  String get dontHaveAccount {
    return Intl.message(
      'Don\'t have an account?',
      name: 'dontHaveAccount',
      desc: '',
      args: [],
    );
  }

  /// `SEND CODE`
  String get sendCode {
    return Intl.message(
      'SEND CODE',
      name: 'sendCode',
      desc: '',
      args: [],
    );
  }

  /// `Login as Guest`
  String get loginAsGuest {
    return Intl.message(
      'Login as Guest',
      name: 'loginAsGuest',
      desc: '',
      args: [],
    );
  }

  /// `Enter your email address and we will send you a code to reset your password.`
  String get emailHint {
    return Intl.message(
      'Enter your email address and we will send you a code to reset your password.',
      name: 'emailHint',
      desc: '',
      args: [],
    );
  }

  /// `WhatsApp Verification`
  String get whatsappVerification {
    return Intl.message(
      'WhatsApp Verification',
      name: 'whatsappVerification',
      desc: '',
      args: [],
    );
  }

  /// `Enter the code sent to your WhatsApp`
  String get enterWhatsappOtp {
    return Intl.message(
      'Enter the code sent to your WhatsApp',
      name: 'enterWhatsappOtp',
      desc: '',
      args: [],
    );
  }

  /// `Enter your phone number`
  String get enterPhoneNumber {
    return Intl.message(
      'Enter your phone number',
      name: 'enterPhoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Phone Number`
  String get phoneNumber {
    return Intl.message(
      'Phone Number',
      name: 'phoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Send`
  String get send {
    return Intl.message(
      'Send',
      name: 'send',
      desc: '',
      args: [],
    );
  }

  /// `Welcome back!`
  String get welcomeBack {
    return Intl.message(
      'Welcome back!',
      name: 'welcomeBack',
      desc: '',
      args: [],
    );
  }

  /// `Recover Password`
  String get recoverPassword {
    return Intl.message(
      'Recover Password',
      name: 'recoverPassword',
      desc: '',
      args: [],
    );
  }

  /// `Invalid phone number`
  String get invalidPhoneNumber {
    return Intl.message(
      'Invalid phone number',
      name: 'invalidPhoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Next`
  String get next {
    return Intl.message(
      'Next',
      name: 'next',
      desc: '',
      args: [],
    );
  }

  /// `By email`
  String get bymail {
    return Intl.message(
      'By email',
      name: 'bymail',
      desc: '',
      args: [],
    );
  }

  /// `By phone`
  String get byphone {
    return Intl.message(
      'By phone',
      name: 'byphone',
      desc: '',
      args: [],
    );
  }

  /// `Please select your gender`
  String get pleaseSelectGender {
    return Intl.message(
      'Please select your gender',
      name: 'pleaseSelectGender',
      desc: '',
      args: [],
    );
  }

  /// `Verification`
  String get verificationTitle {
    return Intl.message(
      'Verification',
      name: 'verificationTitle',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a valid 6-digit code`
  String get invalidVerificationCode {
    return Intl.message(
      'Please enter a valid 6-digit code',
      name: 'invalidVerificationCode',
      desc: '',
      args: [],
    );
  }

  /// `Verification successful!`
  String get verificationSuccess {
    return Intl.message(
      'Verification successful!',
      name: 'verificationSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Verify`
  String get verify {
    return Intl.message(
      'Verify',
      name: 'verify',
      desc: '',
      args: [],
    );
  }

  /// `Didn't receive the code?`
  String get didNotReceiveCode {
    return Intl.message(
      'Didn\'t receive the code?',
      name: 'didNotReceiveCode',
      desc: '',
      args: [],
    );
  }

  /// `Resend Code`
  String get resendCode {
    return Intl.message(
      'Resend Code',
      name: 'resendCode',
      desc: '',
      args: [],
    );
  }

  /// `Verification code resent!`
  String get codeResent {
    return Intl.message(
      'Verification code resent!',
      name: 'codeResent',
      desc: '',
      args: [],
    );
  }

  /// `Create new account`
  String get createNewAccount {
    return Intl.message(
      'Create new account',
      name: 'createNewAccount',
      desc: '',
      args: [],
    );
  }

  /// `Create`
  String get create {
    return Intl.message(
      'Create',
      name: 'create',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get name {
    return Intl.message(
      'Name',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  /// `Already have an account?`
  String get alreadyHaveAccount {
    return Intl.message(
      'Already have an account?',
      name: 'alreadyHaveAccount',
      desc: '',
      args: [],
    );
  }

  /// `Invalid email address`
  String get InvalidEmail {
    return Intl.message(
      'Invalid email address',
      name: 'InvalidEmail',
      desc: '',
      args: [],
    );
  }

  /// `Password must contain letters and numbers, and be at least 8 characters long`
  String get passwordRequirements {
    return Intl.message(
      'Password must contain letters and numbers, and be at least 8 characters long',
      name: 'passwordRequirements',
      desc: '',
      args: [],
    );
  }

  /// `Reset`
  String get reset {
    return Intl.message(
      'Reset',
      name: 'reset',
      desc: '',
      args: [],
    );
  }

  /// `Reset Password`
  String get resetPassword {
    return Intl.message(
      'Reset Password',
      name: 'resetPassword',
      desc: '',
      args: [],
    );
  }

  /// `New Password`
  String get newPassword {
    return Intl.message(
      'New Password',
      name: 'newPassword',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Password`
  String get confirmPassword {
    return Intl.message(
      'Confirm Password',
      name: 'confirmPassword',
      desc: '',
      args: [],
    );
  }

  /// `Passwords do not match`
  String get passwordMismatch {
    return Intl.message(
      'Passwords do not match',
      name: 'passwordMismatch',
      desc: '',
      args: [],
    );
  }

  /// `Password reset successfully`
  String get resetPasswordSuccess {
    return Intl.message(
      'Password reset successfully',
      name: 'resetPasswordSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Confirm New Password`
  String get confirmNewPassword {
    return Intl.message(
      'Confirm New Password',
      name: 'confirmNewPassword',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get home {
    return Intl.message(
      'Home',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  /// `Failed to open payment link`
  String get payment_failed {
    return Intl.message(
      'Failed to open payment link',
      name: 'payment_failed',
      desc: '',
      args: [],
    );
  }

  /// `Camera`
  String get camera {
    return Intl.message(
      'Camera',
      name: 'camera',
      desc: '',
      args: [],
    );
  }

  /// `Gallery`
  String get gallery {
    return Intl.message(
      'Gallery',
      name: 'gallery',
      desc: '',
      args: [],
    );
  }

  /// `Change Password`
  String get change_password {
    return Intl.message(
      'Change Password',
      name: 'change_password',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Password`
  String get confirm_password {
    return Intl.message(
      'Confirm Password',
      name: 'confirm_password',
      desc: '',
      args: [],
    );
  }

  /// `Password confirmation does not match`
  String get confirm_password_validation {
    return Intl.message(
      'Password confirmation does not match',
      name: 'confirm_password_validation',
      desc: '',
      args: [],
    );
  }

  /// `OK`
  String get ok {
    return Intl.message(
      'OK',
      name: 'ok',
      desc: '',
      args: [],
    );
  }

  /// `Select Payment Method`
  String get select_payment_method {
    return Intl.message(
      'Select Payment Method',
      name: 'select_payment_method',
      desc: '',
      args: [],
    );
  }

  /// `No payment methods available.`
  String get no_payment_methods_available {
    return Intl.message(
      'No payment methods available.',
      name: 'no_payment_methods_available',
      desc: '',
      args: [],
    );
  }

  /// `Please select a payment method to continue.`
  String get please_select_payment_method {
    return Intl.message(
      'Please select a payment method to continue.',
      name: 'please_select_payment_method',
      desc: '',
      args: [],
    );
  }

  /// `stars`
  String get stars {
    return Intl.message(
      'stars',
      name: 'stars',
      desc: '',
      args: [],
    );
  }

  /// `SAR`
  String get sar {
    return Intl.message(
      'SAR',
      name: 'sar',
      desc: '',
      args: [],
    );
  }

  /// `Reviews`
  String get reviews {
    return Intl.message(
      'Reviews',
      name: 'reviews',
      desc: '',
      args: [],
    );
  }

  /// `Details`
  String get details {
    return Intl.message(
      'Details',
      name: 'details',
      desc: '',
      args: [],
    );
  }

  /// `See All Reviews`
  String get seeAllReviews {
    return Intl.message(
      'See All Reviews',
      name: 'seeAllReviews',
      desc: '',
      args: [],
    );
  }

  /// `No Reviews Found`
  String get noReviewsFound {
    return Intl.message(
      'No Reviews Found',
      name: 'noReviewsFound',
      desc: '',
      args: [],
    );
  }

  /// `No reviews available for this item yet.`
  String get noReviewsDescription {
    return Intl.message(
      'No reviews available for this item yet.',
      name: 'noReviewsDescription',
      desc: '',
      args: [],
    );
  }

  /// `Review by`
  String get reviewBy {
    return Intl.message(
      'Review by',
      name: 'reviewBy',
      desc: '',
      args: [],
    );
  }

  /// `Error Loading Reviews`
  String get errorLoadingReviews {
    return Intl.message(
      'Error Loading Reviews',
      name: 'errorLoadingReviews',
      desc: '',
      args: [],
    );
  }

  /// `Anonymous`
  String get anonymous {
    return Intl.message(
      'Anonymous',
      name: 'anonymous',
      desc: '',
      args: [],
    );
  }

  /// `Write a Review`
  String get writeReview {
    return Intl.message(
      'Write a Review',
      name: 'writeReview',
      desc: '',
      args: [],
    );
  }

  /// `Your Rating`
  String get yourRating {
    return Intl.message(
      'Your Rating',
      name: 'yourRating',
      desc: '',
      args: [],
    );
  }

  /// `Your Comment (Optional)`
  String get yourComment {
    return Intl.message(
      'Your Comment (Optional)',
      name: 'yourComment',
      desc: '',
      args: [],
    );
  }

  /// `Write your comment here...`
  String get writeYourComment {
    return Intl.message(
      'Write your comment here...',
      name: 'writeYourComment',
      desc: '',
      args: [],
    );
  }

  /// `Failed to submit review`
  String get reviewSubmissionFailed {
    return Intl.message(
      'Failed to submit review',
      name: 'reviewSubmissionFailed',
      desc: '',
      args: [],
    );
  }

  /// `Add Review`
  String get addReview {
    return Intl.message(
      'Add Review',
      name: 'addReview',
      desc: '',
      args: [],
    );
  }

  /// `Rate this item`
  String get rateThisItem {
    return Intl.message(
      'Rate this item',
      name: 'rateThisItem',
      desc: '',
      args: [],
    );
  }

  /// `Be the first to review this item!`
  String get beFirstToReview {
    return Intl.message(
      'Be the first to review this item!',
      name: 'beFirstToReview',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get search {
    return Intl.message(
      'Search',
      name: 'search',
      desc: '',
      args: [],
    );
  }

  /// `Select Country`
  String get selectCountry {
    return Intl.message(
      'Select Country',
      name: 'selectCountry',
      desc: '',
      args: [],
    );
  }

  /// `Getting location details...`
  String get fetchingAddress {
    return Intl.message(
      'Getting location details...',
      name: 'fetchingAddress',
      desc: '',
      args: [],
    );
  }

  /// `Location details not available`
  String get addressNotFound {
    return Intl.message(
      'Location details not available',
      name: 'addressNotFound',
      desc: '',
      args: [],
    );
  }

  /// `Unable to get location details`
  String get failedToGetAddress {
    return Intl.message(
      'Unable to get location details',
      name: 'failedToGetAddress',
      desc: '',
      args: [],
    );
  }

  /// `Profile picture updated successfully`
  String get profile_picture_updated_successfully {
    return Intl.message(
      'Profile picture updated successfully',
      name: 'profile_picture_updated_successfully',
      desc: '',
      args: [],
    );
  }

  /// `4 interest-free installments starting from 18.69 /month. Compliant with Sharia regulations`
  String get installments {
    return Intl.message(
      '4 interest-free installments starting from 18.69 /month. Compliant with Sharia regulations',
      name: 'installments',
      desc: '',
      args: [],
    );
  }

  /// `Type to search...`
  String get type_to_search {
    return Intl.message(
      'Type to search...',
      name: 'type_to_search',
      desc: '',
      args: [],
    );
  }

  /// `No results found.`
  String get no_search_results {
    return Intl.message(
      'No results found.',
      name: 'no_search_results',
      desc: '',
      args: [],
    );
  }

  /// `email address`
  String get emailAddress {
    return Intl.message(
      'email address',
      name: 'emailAddress',
      desc: '',
      args: [],
    );
  }

  /// `Invalid login credentials`
  String get invalidLogin {
    return Intl.message(
      'Invalid login credentials',
      name: 'invalidLogin',
      desc: '',
      args: [],
    );
  }

  /// `Edit Name`
  String get edit_name {
    return Intl.message(
      'Edit Name',
      name: 'edit_name',
      desc: '',
      args: [],
    );
  }

  /// `Enter new name`
  String get enter_new_name {
    return Intl.message(
      'Enter new name',
      name: 'enter_new_name',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get save {
    return Intl.message(
      'Save',
      name: 'save',
      desc: '',
      args: [],
    );
  }

  /// `Name updated successfully`
  String get name_updated_successfully {
    return Intl.message(
      'Name updated successfully',
      name: 'name_updated_successfully',
      desc: '',
      args: [],
    );
  }

  /// `Loading...`
  String get loading {
    return Intl.message(
      'Loading...',
      name: 'loading',
      desc: '',
      args: [],
    );
  }

  /// `Updating...`
  String get updating {
    return Intl.message(
      'Updating...',
      name: 'updating',
      desc: '',
      args: [],
    );
  }

  /// `Sending OTP via WhatsApp...`
  String get sendingOTPViaWhatsApp {
    return Intl.message(
      'Sending OTP via WhatsApp...',
      name: 'sendingOTPViaWhatsApp',
      desc: '',
      args: [],
    );
  }

  /// `Welcome to GemStore!`
  String get welcome {
    return Intl.message(
      'Welcome to GemStore!',
      name: 'welcome',
      desc: '',
      args: [],
    );
  }

  /// `The home for a fashionista`
  String get welcomeSub {
    return Intl.message(
      'The home for a fashionista',
      name: 'welcomeSub',
      desc: '',
      args: [],
    );
  }

  /// `Get Started`
  String get getStarted {
    return Intl.message(
      'Get Started',
      name: 'getStarted',
      desc: '',
      args: [],
    );
  }

  /// `Discover something new `
  String get onBoarding1 {
    return Intl.message(
      'Discover something new ',
      name: 'onBoarding1',
      desc: '',
      args: [],
    );
  }

  /// `Special new arrivals just for you`
  String get onBoarding1SubTitle {
    return Intl.message(
      'Special new arrivals just for you',
      name: 'onBoarding1SubTitle',
      desc: '',
      args: [],
    );
  }

  /// `Shopping Now`
  String get shopNow {
    return Intl.message(
      'Shopping Now',
      name: 'shopNow',
      desc: '',
      args: [],
    );
  }

  /// `Update trendy outfit`
  String get onBoarding2 {
    return Intl.message(
      'Update trendy outfit',
      name: 'onBoarding2',
      desc: '',
      args: [],
    );
  }

  /// `Favorite brands and hottest trends`
  String get onBoarding2SubTitle {
    return Intl.message(
      'Favorite brands and hottest trends',
      name: 'onBoarding2SubTitle',
      desc: '',
      args: [],
    );
  }

  /// `Explore your true style`
  String get onBoarding3 {
    return Intl.message(
      'Explore your true style',
      name: 'onBoarding3',
      desc: '',
      args: [],
    );
  }

  /// `Relax and let us bring the style to you`
  String get onBoarding3SubTitle {
    return Intl.message(
      'Relax and let us bring the style to you',
      name: 'onBoarding3SubTitle',
      desc: '',
      args: [],
    );
  }

  /// `Log into \nyour account`
  String get logInto {
    return Intl.message(
      'Log into \nyour account',
      name: 'logInto',
      desc: '',
      args: [],
    );
  }

  /// `or log in with`
  String get logInWith {
    return Intl.message(
      'or log in with',
      name: 'logInWith',
      desc: '',
      args: [],
    );
  }

  /// `or sign up with`
  String get signUpWith {
    return Intl.message(
      'or sign up with',
      name: 'signUpWith',
      desc: '',
      args: [],
    );
  }

  /// `Enter email associated with your account \n and we’ll send and email with intructions to \n reset your password`
  String get forgetHint {
    return Intl.message(
      'Enter email associated with your account \n and we’ll send and email with intructions to \n reset your password',
      name: 'forgetHint',
      desc: '',
      args: [],
    );
  }

  /// `Verification Code`
  String get verificationCode {
    return Intl.message(
      'Verification Code',
      name: 'verificationCode',
      desc: '',
      args: [],
    );
  }

  /// `Please enter the verification code we sent \n to your email address`
  String get verificationSubtitle {
    return Intl.message(
      'Please enter the verification code we sent \n to your email address',
      name: 'verificationSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Create New Password`
  String get createNewPassword {
    return Intl.message(
      'Create New Password',
      name: 'createNewPassword',
      desc: '',
      args: [],
    );
  }

  /// `Your new password must be different \n from previously used password`
  String get newPasswordSubTitle {
    return Intl.message(
      'Your new password must be different \n from previously used password',
      name: 'newPasswordSubTitle',
      desc: '',
      args: [],
    );
  }

  /// `Your password has been changed`
  String get passwordChanged {
    return Intl.message(
      'Your password has been changed',
      name: 'passwordChanged',
      desc: '',
      args: [],
    );
  }

  /// `Welcome back! Discover now!`
  String get passWelcome {
    return Intl.message(
      'Welcome back! Discover now!',
      name: 'passWelcome',
      desc: '',
      args: [],
    );
  }

  /// `GemStore`
  String get gemStore {
    return Intl.message(
      'GemStore',
      name: 'gemStore',
      desc: '',
      args: [],
    );
  }

  /// `Women`
  String get women {
    return Intl.message(
      'Women',
      name: 'women',
      desc: '',
      args: [],
    );
  }

  /// `Men`
  String get men {
    return Intl.message(
      'Men',
      name: 'men',
      desc: '',
      args: [],
    );
  }

  /// `Accessories`
  String get accessories {
    return Intl.message(
      'Accessories',
      name: 'accessories',
      desc: '',
      args: [],
    );
  }

  /// `Beauty`
  String get beauty {
    return Intl.message(
      'Beauty',
      name: 'beauty',
      desc: '',
      args: [],
    );
  }

  /// `Autumn\nCollection\n2025`
  String get titleOfBanners {
    return Intl.message(
      'Autumn\nCollection\n2025',
      name: 'titleOfBanners',
      desc: '',
      args: [],
    );
  }

  /// `Feature Products`
  String get featureProducts {
    return Intl.message(
      'Feature Products',
      name: 'featureProducts',
      desc: '',
      args: [],
    );
  }

  /// `Show all`
  String get showAll {
    return Intl.message(
      'Show all',
      name: 'showAll',
      desc: '',
      args: [],
    );
  }

  /// `| NEW COLLECTION`
  String get collectionTitle {
    return Intl.message(
      '| NEW COLLECTION',
      name: 'collectionTitle',
      desc: '',
      args: [],
    );
  }

  /// `HANG OUT \n& PARTY`
  String get collectionSubTitle {
    return Intl.message(
      'HANG OUT \n& PARTY',
      name: 'collectionSubTitle',
      desc: '',
      args: [],
    );
  }

  /// `Recommended`
  String get recommended {
    return Intl.message(
      'Recommended',
      name: 'recommended',
      desc: '',
      args: [],
    );
  }

  /// `Top Collection`
  String get topCollection {
    return Intl.message(
      'Top Collection',
      name: 'topCollection',
      desc: '',
      args: [],
    );
  }

  /// `| Sale up to 40%`
  String get sale {
    return Intl.message(
      '| Sale up to 40%',
      name: 'sale',
      desc: '',
      args: [],
    );
  }

  /// `FOR SLIM\n& BEAUTY`
  String get saleSubTitle {
    return Intl.message(
      'FOR SLIM\n& BEAUTY',
      name: 'saleSubTitle',
      desc: '',
      args: [],
    );
  }

  /// `| Summer Collection 2025`
  String get summerCollection {
    return Intl.message(
      '| Summer Collection 2025',
      name: 'summerCollection',
      desc: '',
      args: [],
    );
  }

  /// `Most sexy\n& fabulous\ndesign `
  String get summerCollectionSubTitle {
    return Intl.message(
      'Most sexy\n& fabulous\ndesign ',
      name: 'summerCollectionSubTitle',
      desc: '',
      args: [],
    );
  }

  /// `T-Shirt`
  String get tShirt {
    return Intl.message(
      'T-Shirt',
      name: 'tShirt',
      desc: '',
      args: [],
    );
  }

  /// `The \nOffice\nLife`
  String get tShirtSubTitle {
    return Intl.message(
      'The \nOffice\nLife',
      name: 'tShirtSubTitle',
      desc: '',
      args: [],
    );
  }

  /// `Dresses`
  String get dresses {
    return Intl.message(
      'Dresses',
      name: 'dresses',
      desc: '',
      args: [],
    );
  }

  /// `Elegant\nDesign`
  String get dressesSubTitle {
    return Intl.message(
      'Elegant\nDesign',
      name: 'dressesSubTitle',
      desc: '',
      args: [],
    );
  }

  /// `Shop Now`
  String get shop_now {
    return Intl.message(
      'Shop Now',
      name: 'shop_now',
      desc: '',
      args: [],
    );
  }

  /// `Discover`
  String get discover {
    return Intl.message(
      'Discover',
      name: 'discover',
      desc: '',
      args: [],
    );
  }

  /// `CLOTHING`
  String get clothing {
    return Intl.message(
      'CLOTHING',
      name: 'clothing',
      desc: '',
      args: [],
    );
  }

  /// `ACCESSORIES`
  String get accessoriesCapital {
    return Intl.message(
      'ACCESSORIES',
      name: 'accessoriesCapital',
      desc: '',
      args: [],
    );
  }

  /// `SHOES`
  String get shoes {
    return Intl.message(
      'SHOES',
      name: 'shoes',
      desc: '',
      args: [],
    );
  }

  /// `COLLECTION`
  String get collection {
    return Intl.message(
      'COLLECTION',
      name: 'collection',
      desc: '',
      args: [],
    );
  }

  /// `Recent Searches`
  String get recentSearches {
    return Intl.message(
      'Recent Searches',
      name: 'recentSearches',
      desc: '',
      args: [],
    );
  }

  /// `Popular this week`
  String get popularThisWeek {
    return Intl.message(
      'Popular this week',
      name: 'popularThisWeek',
      desc: '',
      args: [],
    );
  }

  /// `Filter`
  String get filter {
    return Intl.message(
      'Filter',
      name: 'filter',
      desc: '',
      args: [],
    );
  }

  /// `Apply`
  String get apply {
    return Intl.message(
      'Apply',
      name: 'apply',
      desc: '',
      args: [],
    );
  }

  /// `Price`
  String get price {
    return Intl.message(
      'Price',
      name: 'price',
      desc: '',
      args: [],
    );
  }

  /// `Color`
  String get color {
    return Intl.message(
      'Color',
      name: 'color',
      desc: '',
      args: [],
    );
  }

  /// `Star Rating`
  String get starRating {
    return Intl.message(
      'Star Rating',
      name: 'starRating',
      desc: '',
      args: [],
    );
  }

  /// `Discount`
  String get discount {
    return Intl.message(
      'Discount',
      name: 'discount',
      desc: '',
      args: [],
    );
  }

  /// `Category`
  String get category {
    return Intl.message(
      'Category',
      name: 'category',
      desc: '',
      args: [],
    );
  }

  /// `please, select a category`
  String get selectCategory {
    return Intl.message(
      'please, select a category',
      name: 'selectCategory',
      desc: '',
      args: [],
    );
  }

  /// `Found Results`
  String get foundResults {
    return Intl.message(
      'Found Results',
      name: 'foundResults',
      desc: '',
      args: [],
    );
  }

  /// `Add To Cart`
  String get addToCart {
    return Intl.message(
      'Add To Cart',
      name: 'addToCart',
      desc: '',
      args: [],
    );
  }

  /// `show more`
  String get showMore {
    return Intl.message(
      'show more',
      name: 'showMore',
      desc: '',
      args: [],
    );
  }

  /// `show less`
  String get showLess {
    return Intl.message(
      'show less',
      name: 'showLess',
      desc: '',
      args: [],
    );
  }

  /// `ratings`
  String get ratings {
    return Intl.message(
      'ratings',
      name: 'ratings',
      desc: '',
      args: [],
    );
  }

  /// `quantity`
  String get quantity {
    return Intl.message(
      'quantity',
      name: 'quantity',
      desc: '',
      args: [],
    );
  }

  /// `in stock`
  String get inStock {
    return Intl.message(
      'in stock',
      name: 'inStock',
      desc: '',
      args: [],
    );
  }

  /// `views`
  String get views {
    return Intl.message(
      'views',
      name: 'views',
      desc: '',
      args: [],
    );
  }

  /// `writ your review`
  String get writeYourReview {
    return Intl.message(
      'writ your review',
      name: 'writeYourReview',
      desc: '',
      args: [],
    );
  }

  /// `submit review`
  String get submitReview {
    return Intl.message(
      'submit review',
      name: 'submitReview',
      desc: '',
      args: [],
    );
  }

  /// `featured products`
  String get featured_products {
    return Intl.message(
      'featured products',
      name: 'featured_products',
      desc: '',
      args: [],
    );
  }

  /// `Product Description`
  String get productDescription {
    return Intl.message(
      'Product Description',
      name: 'productDescription',
      desc: '',
      args: [],
    );
  }

  /// `My Cart`
  String get myCart {
    return Intl.message(
      'My Cart',
      name: 'myCart',
      desc: '',
      args: [],
    );
  }

  /// `Your cart is empty`
  String get emptyCart {
    return Intl.message(
      'Your cart is empty',
      name: 'emptyCart',
      desc: '',
      args: [],
    );
  }

  /// `Promo code`
  String get promoCode {
    return Intl.message(
      'Promo code',
      name: 'promoCode',
      desc: '',
      args: [],
    );
  }

  /// `Enter promo code`
  String get enterPromoCode {
    return Intl.message(
      'Enter promo code',
      name: 'enterPromoCode',
      desc: '',
      args: [],
    );
  }

  /// `Subtotal`
  String get subtotal {
    return Intl.message(
      'Subtotal',
      name: 'subtotal',
      desc: '',
      args: [],
    );
  }

  /// `Shipping`
  String get shipping {
    return Intl.message(
      'Shipping',
      name: 'shipping',
      desc: '',
      args: [],
    );
  }

  /// `Total`
  String get total {
    return Intl.message(
      'Total',
      name: 'total',
      desc: '',
      args: [],
    );
  }

  /// `Checkout`
  String get checkout {
    return Intl.message(
      'Checkout',
      name: 'checkout',
      desc: '',
      args: [],
    );
  }

  /// `My Orders`
  String get myOrders {
    return Intl.message(
      'My Orders',
      name: 'myOrders',
      desc: '',
      args: [],
    );
  }

  /// `Shipping Addresses`
  String get shippingAddresses {
    return Intl.message(
      'Shipping Addresses',
      name: 'shippingAddresses',
      desc: '',
      args: [],
    );
  }

  /// `Payment Methods`
  String get paymentMethods {
    return Intl.message(
      'Payment Methods',
      name: 'paymentMethods',
      desc: '',
      args: [],
    );
  }

  /// `My Reviews`
  String get myReviews {
    return Intl.message(
      'My Reviews',
      name: 'myReviews',
      desc: '',
      args: [],
    );
  }

  /// `Log Out`
  String get logOut {
    return Intl.message(
      'Log Out',
      name: 'logOut',
      desc: '',
      args: [],
    );
  }

  /// `Your order has been placed successfully!`
  String get orderPlacedSuccess {
    return Intl.message(
      'Your order has been placed successfully!',
      name: 'orderPlacedSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Back to Home`
  String get backToHome {
    return Intl.message(
      'Back to Home',
      name: 'backToHome',
      desc: '',
      args: [],
    );
  }

  /// `Notifications`
  String get notifications {
    return Intl.message(
      'Notifications',
      name: 'notifications',
      desc: '',
      args: [],
    );
  }

  /// `Wishlist`
  String get wishlist {
    return Intl.message(
      'Wishlist',
      name: 'wishlist',
      desc: '',
      args: [],
    );
  }

  /// `No reviews yet`
  String get noReviews {
    return Intl.message(
      'No reviews yet',
      name: 'noReviews',
      desc: '',
      args: [],
    );
  }

  /// `No new notifications`
  String get noNotifications {
    return Intl.message(
      'No new notifications',
      name: 'noNotifications',
      desc: '',
      args: [],
    );
  }

  /// `When you have new notifications, they will appear here.`
  String get noNotificationsMessage {
    return Intl.message(
      'When you have new notifications, they will appear here.',
      name: 'noNotificationsMessage',
      desc: '',
      args: [],
    );
  }

  /// `Your wishlist is empty`
  String get emptyWishlist {
    return Intl.message(
      'Your wishlist is empty',
      name: 'emptyWishlist',
      desc: '',
      args: [],
    );
  }

  /// `Price Range`
  String get priceRange {
    return Intl.message(
      'Price Range',
      name: 'priceRange',
      desc: '',
      args: [],
    );
  }

  /// `Colors`
  String get colors {
    return Intl.message(
      'Colors',
      name: 'colors',
      desc: '',
      args: [],
    );
  }

  /// `Sizes`
  String get sizes {
    return Intl.message(
      'Sizes',
      name: 'sizes',
      desc: '',
      args: [],
    );
  }

  /// `Add New Card`
  String get addNewCard {
    return Intl.message(
      'Add New Card',
      name: 'addNewCard',
      desc: '',
      args: [],
    );
  }

  /// `Card Number`
  String get cardNumber {
    return Intl.message(
      'Card Number',
      name: 'cardNumber',
      desc: '',
      args: [],
    );
  }

  /// `Expiry Date`
  String get expiryDate {
    return Intl.message(
      'Expiry Date',
      name: 'expiryDate',
      desc: '',
      args: [],
    );
  }

  /// `CVV`
  String get cvv {
    return Intl.message(
      'CVV',
      name: 'cvv',
      desc: '',
      args: [],
    );
  }

  /// `Card Holder Name`
  String get cardHolderName {
    return Intl.message(
      'Card Holder Name',
      name: 'cardHolderName',
      desc: '',
      args: [],
    );
  }

  /// `Add New Address`
  String get addNewAddress {
    return Intl.message(
      'Add New Address',
      name: 'addNewAddress',
      desc: '',
      args: [],
    );
  }

  /// `Street Address`
  String get streetAddress {
    return Intl.message(
      'Street Address',
      name: 'streetAddress',
      desc: '',
      args: [],
    );
  }

  /// `City`
  String get city {
    return Intl.message(
      'City',
      name: 'city',
      desc: '',
      args: [],
    );
  }

  /// `State`
  String get state {
    return Intl.message(
      'State',
      name: 'state',
      desc: '',
      args: [],
    );
  }

  /// `Zip Code`
  String get zipCode {
    return Intl.message(
      'Zip Code',
      name: 'zipCode',
      desc: '',
      args: [],
    );
  }

  /// `Delivered`
  String get delivered {
    return Intl.message(
      'Delivered',
      name: 'delivered',
      desc: '',
      args: [],
    );
  }

  /// `Processing`
  String get processing {
    return Intl.message(
      'Processing',
      name: 'processing',
      desc: '',
      args: [],
    );
  }

  /// `Cancelled`
  String get cancelled {
    return Intl.message(
      'Cancelled',
      name: 'cancelled',
      desc: '',
      args: [],
    );
  }

  /// `Total Amount`
  String get totalAmount {
    return Intl.message(
      'Total Amount',
      name: 'totalAmount',
      desc: '',
      args: [],
    );
  }

  /// `Order Arrived!`
  String get orderArrived {
    return Intl.message(
      'Order Arrived!',
      name: 'orderArrived',
      desc: '',
      args: [],
    );
  }

  /// `Your order has been successfully delivered.`
  String get orderDeliveredMessage {
    return Intl.message(
      'Your order has been successfully delivered.',
      name: 'orderDeliveredMessage',
      desc: '',
      args: [],
    );
  }

  /// `Mohamed Ahmed`
  String get userName {
    return Intl.message(
      'Mohamed Ahmed',
      name: 'userName',
      desc: '',
      args: [],
    );
  }

  /// `mohamed.ahmed@example.com`
  String get userEmail {
    return Intl.message(
      'mohamed.ahmed@example.com',
      name: 'userEmail',
      desc: '',
      args: [],
    );
  }

  /// `Jacket`
  String get jacket {
    return Intl.message(
      'Jacket',
      name: 'jacket',
      desc: '',
      args: [],
    );
  }

  /// `Hoodie`
  String get hoodie {
    return Intl.message(
      'Hoodie',
      name: 'hoodie',
      desc: '',
      args: [],
    );
  }

  /// `Pants`
  String get pants {
    return Intl.message(
      'Pants',
      name: 'pants',
      desc: '',
      args: [],
    );
  }

  /// `Watch`
  String get watch {
    return Intl.message(
      'Watch',
      name: 'watch',
      desc: '',
      args: [],
    );
  }

  /// `Ring`
  String get ring {
    return Intl.message(
      'Ring',
      name: 'ring',
      desc: '',
      args: [],
    );
  }

  /// `Bracelet`
  String get bracelet {
    return Intl.message(
      'Bracelet',
      name: 'bracelet',
      desc: '',
      args: [],
    );
  }

  /// `Sunglasses`
  String get sunglasses {
    return Intl.message(
      'Sunglasses',
      name: 'sunglasses',
      desc: '',
      args: [],
    );
  }

  /// `Sneakers`
  String get sneakers {
    return Intl.message(
      'Sneakers',
      name: 'sneakers',
      desc: '',
      args: [],
    );
  }

  /// `Boots`
  String get boots {
    return Intl.message(
      'Boots',
      name: 'boots',
      desc: '',
      args: [],
    );
  }

  /// `Heels`
  String get heels {
    return Intl.message(
      'Heels',
      name: 'heels',
      desc: '',
      args: [],
    );
  }

  /// `Slippers`
  String get slippers {
    return Intl.message(
      'Slippers',
      name: 'slippers',
      desc: '',
      args: [],
    );
  }

  /// `Summer 2025`
  String get summerCollectionStats {
    return Intl.message(
      'Summer 2025',
      name: 'summerCollectionStats',
      desc: '',
      args: [],
    );
  }

  /// `Winter 2025`
  String get winterCollectionStats {
    return Intl.message(
      'Winter 2025',
      name: 'winterCollectionStats',
      desc: '',
      args: [],
    );
  }

  /// `Autumn 2025`
  String get autumnCollectionStats {
    return Intl.message(
      'Autumn 2025',
      name: 'autumnCollectionStats',
      desc: '',
      args: [],
    );
  }

  /// `Modern Sunglasses`
  String get modernSunglasses {
    return Intl.message(
      'Modern Sunglasses',
      name: 'modernSunglasses',
      desc: '',
      args: [],
    );
  }

  /// `Blue T-Shirt`
  String get blueTShirt {
    return Intl.message(
      'Blue T-Shirt',
      name: 'blueTShirt',
      desc: '',
      args: [],
    );
  }

  /// `{count} items`
  String itemCount(Object count) {
    return Intl.message(
      '$count items',
      name: 'itemCount',
      desc: '',
      args: [count],
    );
  }

  /// `Jeans`
  String get jeans {
    return Intl.message(
      'Jeans',
      name: 'jeans',
      desc: '',
      args: [],
    );
  }

  /// `Crop Tops`
  String get cropTops {
    return Intl.message(
      'Crop Tops',
      name: 'cropTops',
      desc: '',
      args: [],
    );
  }

  /// `Pending`
  String get pending {
    return Intl.message(
      'Pending',
      name: 'pending',
      desc: '',
      args: [],
    );
  }

  /// `Continue Shopping`
  String get continueShopping {
    return Intl.message(
      'Continue Shopping',
      name: 'continueShopping',
      desc: '',
      args: [],
    );
  }

  /// `There is no description`
  String get noDescription {
    return Intl.message(
      'There is no description',
      name: 'noDescription',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get language {
    return Intl.message(
      'Language',
      name: 'language',
      desc: '',
      args: [],
    );
  }

  /// `Arabic`
  String get arabic {
    return Intl.message(
      'Arabic',
      name: 'arabic',
      desc: '',
      args: [],
    );
  }

  /// `English`
  String get english {
    return Intl.message(
      'English',
      name: 'english',
      desc: '',
      args: [],
    );
  }

  /// `An error occurred`
  String get errorOccurred {
    return Intl.message(
      'An error occurred',
      name: 'errorOccurred',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
