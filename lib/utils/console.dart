part of utils;

abstract class Console {
  static final _log = Logger(filter: _LogFilter());

  Console(String jsonEncode, {required int wrapWidth});

  static void log(dynamic message, {String? string}) => _log.d(message, string);
}

class _LogFilter extends LogFilter {
  @override
  bool shouldLog(LogEvent event) => !kReleaseMode;
}
