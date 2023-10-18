part of utils;

// const String kServerUrl = kReleaseMode
//     ? 'http://api.app.xsyy.beijingliuli.top'
//     : 'http://csxsyyapi.beijingliuli.top';

const String kServerUrl = 'http://api.app.xsyy.beijingliuli.top';

// const String kLocalToken = 'local_token';
// const String kLocalThemeMode = 'local_theme_mode';
// const String kLocalLanguage = 'local_language';
// const String kLocalExamAQ = 'local_exam_aq';

// const String kThemeSystem = '0';
// const String kThemeLight = '1';
// const String kThemeDark = '2';

class Regular {
  static bool hasMatch(String? s, RegExp p) {
    return (s == null) ? false : p.hasMatch(s);
  }

  static final RegExp htmlRegex = RegExp(r'<[^>]*>');
}
