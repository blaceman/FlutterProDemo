part of utils;

extension ExtensionString on String? {
  ///检查字符串是否是手机
  /*bool isPhone() => Regular.hasMatch(this, Regular.phone);

  ///检查字符串是否是密码
  bool isPassword() => Regular.hasMatch(this, Regular.password);*/


  ///检查字符串是否是密码
  bool isHtml() => Regular.hasMatch(this, Regular.htmlRegex);

  // ///检查字符串是否是密码
  // bool isCardNo() => Regular.hasMatch(this, Regular.card);
  //
  // /// 检查字符串是否只包含数字(无空格和符号)
  // bool isNumericOnly() => Regular.hasMatch(this, Regular.numericOnly);
  //
  // /// 检查字符串是否只包含字母(无空格和符号)
  // bool isAlphabetOnly() => Regular.hasMatch(this, Regular.alphabetOnly);
  //
  // /// 检查字符串是否为图像文件
  // bool isImage() => Regular.hasMatch(this, Regular.image);
  //
  // /// 检查字符串是否为url文件
  // bool isURL() => Regular.hasMatch(this, Regular.url);


}
