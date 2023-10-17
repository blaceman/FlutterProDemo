part of string_res;

class LanguageRes extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'zh_CN': zhCnRes,
        'en_US': enUSRes,
      };
}
