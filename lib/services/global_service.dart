part of services;

//全局配置
class GlobalService extends GetxService {
  static GlobalService get to => Get.find();
  UserModel userModel = UserModel();
  bool get isLogin =>
      GlobalService.to.userModel.phoneNum != null &&
      GlobalService.to.userModel.phoneNum!.isNotEmpty;

  ValueNotifier<bool> loginAction = ValueNotifier<bool>(false); //也可以使用obx刷新数据

  void saveUser(String phone, String code) {
    userModel.phoneNum = phone;
    userModel.code = code;
    loginAction.value = true;
  }

  void removeUser() {
    userModel.phoneNum = '';
    userModel.code = '';
    loginAction.value = false;
  }
}
