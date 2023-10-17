part of login_page;

class LoginControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController());
  }
}

class LoginController extends GetxController {
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
