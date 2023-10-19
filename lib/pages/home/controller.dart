part of home_page;

class HomeController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void onReady() {
    GlobalService.to.loginAction.addListener(() {
      //也可以使用obx刷新数据
      update();
      Console.log('12222');
    });
    super.onReady();
  }
}
