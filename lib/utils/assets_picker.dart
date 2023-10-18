part of utils;

abstract class AssetsPicker {
  static final ImagePicker _picker = ImagePicker();

  static Future<File?> image({
    required BuildContext context,
    ImageSource source = ImageSource.gallery,
    double maxWidth = 1920,
    double maxHeight = 1080,
  }) async {
    if (!(await Access.photos())) {
      if (context.mounted) {
        // CustomDialog.showAccess(
        //   context: context,
        //   content: const Text('需要访问您的照片库'),
        // );
        Console.log('需要访问您的相册');
      }
      return null;
    }
    final result = await _picker.pickImage(
      source: source,
      maxWidth: maxWidth,
      maxHeight: maxHeight,
    );
    if (result == null) return null;
    return File(result.path);
  }

  static Future<List<File>?> multiImage({
    required BuildContext context,
    double maxWidth = 1920,
    double maxHeight = 1080,
  }) async {
    if (!(await Access.photos())) {
      if (context.mounted) {
        /*CustomDialog.showAccess(
          context: context,
          content: const Text('Requires access to your photo gallery'),
        );*/
        Console.log('没有 Photos 权限');
      }
      return null;
    }
    final result = await _picker.pickMultiImage(
      maxWidth: maxWidth,
      maxHeight: maxHeight,
    );
    if (result.isEmpty) return null;
    return result.map((item) => File(item.path)).toList();
  }
}
