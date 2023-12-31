class Validator {
  ///Password validation
  ///[value] Password for validation
  static String? validatePassword(String value) {
    RegExp regex =
        RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
    if (value.isEmpty) {
      return 'Please enter password';
    } else {
      if (!regex.hasMatch(value)) {
        return 'Password much be 8 character long and must contain 1 upper case letter 1 lower case letter and 1 number!';
      } else {
        return null;
      }
    }
  }

  ///Email validation
  /// [value] email for validation
  static String? validateEmail(String value) {
    RegExp regex = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    if (value.isEmpty) {
      return 'Please enter Email';
    } else {
      if (!regex.hasMatch(value)) {
        return 'Please enter valid email!';
      } else {
        return null;
      }
    }
  }

  ///Name validation
  /// [type] type is for name type
  /// [value] email for validation
  static String? validateName(String type, String value) {
    if (value.isEmpty) {
      return 'Please enter $type';
    } else {
      return null;
    }
  }
}
