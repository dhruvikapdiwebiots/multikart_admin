class LoginValidator{

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
}