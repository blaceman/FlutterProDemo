part of user_info_page;

class UserInfoControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => UserInfoController());
  }
}

class UserInfoController extends GetxController {
  String get phoneStr => '账号：${GlobalService.to.userModel.phoneNum!}';
  String get codeStr => '密码：${GlobalService.to.userModel.code!}';
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void onReady() {
    //
    super.onReady();
  }
}
