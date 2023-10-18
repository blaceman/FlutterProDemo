part of home_page;

class HomeControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
  }
}

class HomeController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void onReady() {
    GlobalService.to.loginAction.addListener(() {
      update();
      Console.log('12222');
    });
    super.onReady();
  }
}
