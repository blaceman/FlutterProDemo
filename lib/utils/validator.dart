part of utils;

abstract class Validator<T> {
  final String error;

  Validator(this.error);

  bool isValid(T value);

  String? call(T value) => isValid(value) ? null : error;

  bool hasMatch(
    String pattern,
    String value, {
    bool caseSensitive = true,
  }) =>
      RegExp(
        pattern,
        caseSensitive: caseSensitive,
      ).hasMatch(value);
}

class PhoneValidator extends Validator<String?> {
  final Pattern _pattern =
      r'^1(3\d|4[5-9]|5[0-35-9]|6[567]|7[0-8]|8\d|9[0-35-9])\d{8}$';

  PhoneValidator() : super('请输入正确的手机号码');

  @override
  bool isValid(String? value) {
    if ((value ?? '').isEmpty) return false;
    return hasMatch(_pattern.toString(), value!, caseSensitive: false);
  }
}
