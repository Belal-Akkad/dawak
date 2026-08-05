enum VerifyOtpType {
  register,
  resetPassword,
}

VerifyOtpType resolveVerifyOtpType(
  Object? arguments, {
  required VerifyOtpType fallback,
}) {
  if (arguments is VerifyOtpType) {
    return arguments;
  }

  return fallback;
}
