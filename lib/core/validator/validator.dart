String? validatePassword(String? value) {
  if (value == null || value.trim().isEmpty) {
    return 'Password cannot be empty';
  }

  if (value.length < 6) {
    return 'Password must be at least 6 characters long';
  }

  return null;
}

String? validateEmail(String? value) {
  if (value == null || value.trim().isEmpty) {
    return 'Email cannot be empty';
  }
  const emailPattern = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
  final regex = RegExp(emailPattern);

  if (!regex.hasMatch(value.trim())) {
    return 'Enter a valid email address';
  }
  return null;
}
