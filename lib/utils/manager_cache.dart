part of utils;

class CacheUtils {
  /// 获取缓存
  static Future<double> loadApplicationCache() async {
    /// 获取文件夹
    Directory directory = await getApplicationDocumentsDirectory();

    /// 获取缓存大小
    double value = await getTotalSizeOfFilesInDir(directory);
    return value;
  }

  /// 循环计算文件的大小（递归）
  static Future<double> getTotalSizeOfFilesInDir(
      final FileSystemEntity file) async {
    if (file is File) {
      int length = await file.length();
      return double.parse(length.toString());
    }
    if (file is Directory) {
      final List<FileSystemEntity> children = file.listSync();
      double total = 0;
      for (final FileSystemEntity child in children) {
        total += await getTotalSizeOfFilesInDir(child);
      }
      return total;
    }
    return 0;
  }

  /// 缓存大小格式转换
  static String formatSize(double value) {
    List<String> unitArr = List<String>.from(['B', 'K', 'M', 'G']);

    int index = 0;
    while (value > 1024) {
      index++;
      value = value / 1024;
    }
    String size = value.toStringAsFixed(2);
    return size + unitArr[index];
  }

  /// 删除缓存
  static Future<void> clearApplicationCache() async {
    Directory directory = await getApplicationDocumentsDirectory();
    //删除缓存目录
    await deleteDirectory(directory);
  }

  /// 递归方式删除目录
  static Future<void> deleteDirectory(FileSystemEntity file) async {
    if (file is Directory && file.existsSync()) {
      final List<FileSystemEntity> children = file.listSync();
      for (final FileSystemEntity child in children) {
        await deleteDirectory(child);
      }
    } else {
      if (file.uri.pathSegments.last == 'userinfo.hive') {
        return; // Skip deletion for userinfo.hive
      }
      await file.delete();
    }
  }
}
