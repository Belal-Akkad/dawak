String formatPrice(double number) {
  return number.toStringAsFixed(2).replaceFirst(RegExp(r'\.?0+$'), '');
}