import 'package:get/get.dart';

class GlobalControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => GlobalController());
  }
}

//全局配置
class GlobalController extends GetxController {
  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
}
