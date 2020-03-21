class AppUtils {
  bool validateEmail(String email) {
    String source =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = RegExp(source);

    return regExp.hasMatch(email);
  }

  String firebaseErrorMessages(String result) {
    String error = '';
    switch (error) {
      case "ERROR_INVALID_EMAIL":
        error = "Your email address appears to be malformed.";

        break;
      case "ERROR_WRONG_PASSWORD":
        error = "Your password is wrong.";

        break;
      case "ERROR_USER_NOT_FOUND":
        error = "User with this email doesn't exist.";

        break;
      case "ERROR_USER_DISABLED":
        error = "User with this email has been disabled.";

        break;
      case "ERROR_TOO_MANY_REQUESTS":
        error = "Too many requests. Try again later.";

        break;
      case "ERROR_OPERATION_NOT_ALLOWED":
        error = "Signing in with Email and Password is not enabled.";

        break;
      default:
        error = "An undefined Error happened.";
    }

    print('Error Message From Firebase: $error');
    return error;
  }
}
