part of login_page;

class LoginControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController());
  }
}

class LoginController extends GetxController {
  final TextEditingController phoneInput = TextEditingController();
  final TextEditingController codeInput = TextEditingController();
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

  void onLogin() {
    final phone = phoneInput.value.text.trim();
    final code = codeInput.value.text.trim();
    if (phone.isEmpty || !phone.isPhoneNumber) {
      CustomToast.text(SR.tipPhoneNum.tr);
      return;
    }
    if (code.isEmpty) {
      CustomToast.text(SR.tipCode.tr);
      return;
    }
    Tools.unfocus();

    CustomToast.loading();
    Future.delayed(const Duration(seconds: 2), () {
      // 在1秒后执行的代码
      CustomToast.dismiss();
      GlobalService.to.saveUser(phone, code);

      CustomToast.success(SR.success);
      // Get.back();
      // Get.offAllNamed(Routers.main);
      Get.until((route) => route.isFirst);
    });
  }
}
