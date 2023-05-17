import 'package:multikart_admin/config.dart';

class LoginValidator {
  // Check user name Validation
  String? checkNameValidation(value) {
    if (value.isEmpty) {
      return "Please Enter Name";
    } else {
      return null;
    }
  }

  // Check Password Validation
  String? checkPasswordValidation(value) {
    if (value.isEmpty) {
      return "Please Enter Password";
    } else {
      return null;
    }
  }

  statusValidation(status) {
    if (status.isEmpty) {
      return fonts.pleaseEnterValue.tr;
    }
    return null;
  }
}
