class Validator {
  Validator._();
  static String? isValidEmail(String? email) {
    final RegExp emailExp = RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$',
    );
    if (email!.isEmpty) {
      return 'Email is required';
    } else if (!emailExp.hasMatch(email)) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  static String? isValidPassword(String? password) {
    if (password!.isEmpty) {
      return 'Password is required';
    } else if (password.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }
}
