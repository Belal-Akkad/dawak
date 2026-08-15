enum FieldType {
  fullName,
  email,
  password,
  confirmPassword,
  phone,
  search,
  activationCode,
}

class Validators {
  Validators._();

  static final RegExp _emailRegExp = RegExp(
    r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@"
    r"[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?"
    r"(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)+$",
  );
  static final RegExp _phoneRegExp = RegExp(r'^9\d{8}$');

  static final RegExp _fullNameRegExp = RegExp(r'^[\u0600-\u06FFa-zA-Z\s]+$');

  static String? requiredField(String? value, {required String fieldName}) {
    if ((value ?? '').trim().isEmpty) {
      return 'حقل $fieldName مطلوب';
    }
    return null;
  }

  static String? email(String? value) {
    final String trimmedValue = (value ?? '').trim();

    if (trimmedValue.isEmpty) {
      return 'البريد الإلكتروني مطلوب';
    }

    if (!_emailRegExp.hasMatch(trimmedValue)) {
      return 'أدخل بريدًا إلكترونيًا صحيحًا';
    }

    return null;
  }

  static String? search(String? value) {
    return null;
  }

  static String? password(String? value, {int minLength = 8}) {
    final String trimmedValue = (value ?? '').trim();

    if (trimmedValue.isEmpty) {
      return 'كلمة المرور مطلوبة';
    }

    if (trimmedValue.length < minLength) {
      return 'يجب أن تكون كلمة المرور $minLength أحرف على الأقل';
    }

    return null;
  }

  static String? confirmPassword(String? value, String password) {
    final String trimmedValue = (value ?? '').trim();

    if (trimmedValue.isEmpty) {
      return 'يرجى تأكيد كلمة المرور';
    }

    if (trimmedValue != password.trim()) {
      return 'كلمتا المرور غير متطابقتين';
    }

    return null;
  }

  static String? phone(String? value) {
    final String trimmedValue = (value ?? '').trim();

    if (trimmedValue.isEmpty) {
      return 'رقم الهاتف مطلوب';
    }

    if (!_phoneRegExp.hasMatch(trimmedValue)) {
      return 'يجب أن يبدأ الرقم بـ 9 ويتكون من 9 أرقام';
    }

    return null;
  }

  static String? fullName(String? value) {
    final String trimmedValue = (value ?? '').trim();

    if (trimmedValue.isEmpty) {
      return 'الاسم الثلاثي مطلوب';
    }

    if (!_fullNameRegExp.hasMatch(trimmedValue)) {
      return 'الاسم يجب أن يحتوي على أحرف فقط';
    }

    final parts = trimmedValue.split(RegExp(r'\s+'));

    if (parts.length < 3) {
      return 'يرجى إدخال الاسم الثلاثي';
    }

    if (parts.any((part) => part.length < 2)) {
      return 'يرجى إدخال اسم صحيح';
    }

    return null;
  }
}
