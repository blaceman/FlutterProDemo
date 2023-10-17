part of home_page;

class HomeControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
  }
}

class HomeController extends GetxController {
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
