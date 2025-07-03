import 'package:flutter/material.dart';

enum ApplePayContactFieldsType { name, emailAddress }

class Stripe {
  static StripeInstance instance = StripeInstance();

  static String? publishableKey;
  static String? merchantIdentifier;
  static String? urlScheme;
}

class StripeInstance {
  Future<void> applySettings() async {}

  Future<bool> isPlatformPaySupported({
    IsGooglePaySupportedParams? googlePay,
  }) async =>
      false;

  Future<void> openApplePaySetup() async {}

  Future<void> confirmPlatformPayPaymentIntent({
    PlatformPayConfirmParams? confirmParams,
    String? clientSecret,
  }) async {}

  Future<void> initPaymentSheet({
    SetupPaymentSheetParameters? paymentSheetParameters,
  }) async {}

  Future<void> presentPaymentSheet() async {}
}

class PlatformPayConfirmParams {
  PlatformPayConfirmParams.applePay({ApplePayParams? applePay}) {}

  PlatformPayConfirmParams.googlePay({GooglePayParams? googlePay}) {}
}

class ApplePayParams {
  List<ApplePayCartSummaryItem> cartItems;
  String merchantCountryCode;
  String currencyCode;
  List<ApplePayContactFieldsType> requiredBillingContactFields;

  ApplePayParams({
    required this.cartItems,
    required this.merchantCountryCode,
    required this.currencyCode,
    required this.requiredBillingContactFields,
  });
}

class ApplePayCartSummaryItem {
  ApplePayCartSummaryItem.immediate({
    required String label,
    required String amount,
    bool isPending = false,
  }) {}
}

class IsGooglePaySupportedParams {
  final bool testEnv;
  final bool existingPaymentMethodRequired;

  IsGooglePaySupportedParams({
    required this.testEnv,
    required this.existingPaymentMethodRequired,
  });
}

class GooglePayParams {
  final String? merchantName;
  final String? merchantCountryCode;
  final bool isEmailRequired;
  final bool testEnv;
  final String currencyCode;

  GooglePayParams({
    this.merchantName,
    this.merchantCountryCode,
    this.isEmailRequired = false,
    this.testEnv = false,
    required this.currencyCode,
  });
}

class BillingDetails {
  String? name;
  String? email;
  String? phone;
  Address? address;

  BillingDetails({this.name, this.email, this.phone, this.address});
}

class Address {
  String? line1;
  String? line2;
  String? city;
  String? state;
  String? postalCode;
  String? country;

  Address({
    this.line1,
    this.line2,
    this.city,
    this.state,
    this.postalCode,
    this.country,
  });
}

class SetupPaymentSheetParameters {
  String? paymentIntentClientSecret;
  String? merchantDisplayName;
  String? customerId;
  String? returnURL;
  String? setupIntentClientSecret;
  String? customerEphemeralKeySecret;
  ThemeMode style;
  PaymentSheetAppearance? appearance;
  BillingDetails? billingDetails;

  SetupPaymentSheetParameters({
    this.paymentIntentClientSecret,
    this.merchantDisplayName,
    this.customerId,
    this.returnURL,
    this.setupIntentClientSecret,
    this.customerEphemeralKeySecret,
    this.style = ThemeMode.light,
    this.appearance,
    this.billingDetails,
  });
}

class PaymentSheetAppearance {
  PaymentSheetAppearanceColors? colors;
  PaymentSheetPrimaryButtonAppearance? primaryButton;

  PaymentSheetAppearance({this.colors, this.primaryButton});
}

class PaymentSheetAppearanceColors {
  Color? primary;

  PaymentSheetAppearanceColors({this.primary});
}

class PaymentSheetPrimaryButtonAppearance {
  PaymentSheetPrimaryButtonTheme? colors;

  PaymentSheetPrimaryButtonAppearance({this.colors});
}

class PaymentSheetPrimaryButtonTheme {
  PaymentSheetPrimaryButtonThemeColors? dark;
  PaymentSheetPrimaryButtonThemeColors? light;

  PaymentSheetPrimaryButtonTheme({this.dark, this.light});
}

class PaymentSheetPrimaryButtonThemeColors {
  Color? background;

  PaymentSheetPrimaryButtonThemeColors({this.background});
}

class StripeException implements Exception {
  final String message;
  final StripeError error;
  StripeException({required this.message})
      : error = StripeError(message: message);
}

class StripeError {
  final String message;
  StripeError({required this.message});

  String? get localizedMessage => message;
}
