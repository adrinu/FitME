
// Validates password field
String passwordValidator(String password) {
  if (password.isEmpty) {
    return 'Enter a password';
  }
  return null;
}

// Validates name field
    // No Empty Field
String emailValidator(String email) {
  if (email.isEmpty) {
    return 'Enter a email';
  }
  if (!email.contains("@")) {
    return 'Enter a email';
  }
  return null;
}

// Validates the name of Food when adding/editing entry
String nameValidator(String name) {
  if (name.isEmpty) {
    return 'Enter a name';
  }
  return null;
}

// Validates the number entered (No negatives/spaces)
String numValidator(String number) {
  if (number.isEmpty) {
    return 'Enter a value';
  }

  if (number.contains(' ')) {
    return 'Invalid value';
  }

  if (num.parse(number) < 0) {
    return 'Invalid value';
  }
  return null;
}

//Formats strings to a string and trims whitespaces, returns a string
String formatString(string) {
  return string.toString().trim();
}
