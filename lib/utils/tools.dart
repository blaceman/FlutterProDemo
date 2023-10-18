part of utils;

abstract class Tools {
  static void unfocus() {
    WidgetsBinding.instance.focusManager.primaryFocus?.unfocus();
  }

  static String toPoint(double? value) {
    if (value == null) return '0';
    final exp = RegExp(r"([.]*0+)(?!.*\d)");
    return value.toStringAsFixed(2).replaceAll(exp, '');
  }

  static String dateFromMS(
    int? timestamp, {
    String pattern = 'yyyy-MM-dd',
    bool humanize = true,
  }) {
    final dateTime = DateTime.fromMillisecondsSinceEpoch(timestamp ?? 0);
    if (humanize) {
      final now = DateTime.now();
      final difference = now.difference(dateTime);
      if (difference.inMinutes < 60) {
        if (difference.inMinutes < 1) return '刚刚';
        return '${difference.inMinutes}分钟前';
      } else if (difference.inHours < 24) {
        return '${difference.inHours}小时前';
      } else if (difference.inDays < 30) {
        return '${difference.inDays}天前';
      } else if (now.year == dateTime.year) {
        return DateFormat('MM-dd').format(dateTime);
      }
    }

    return DateFormat(pattern).format(dateTime);
  }
}
