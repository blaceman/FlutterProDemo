part of mine_page;

class MineController extends GetxController {
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

  void updateUI() {
    update();
  }

  void changeTheme() {
    Get.changeThemeMode(Get.isDarkMode ? ThemeMode.light : ThemeMode.dark);
  }

  void changeLanguage() {
    if (Get.locale == const Locale('zh', 'CN')) {
      Get.updateLocale(const Locale('en', 'US'));
    } else {
      Get.updateLocale(const Locale('zh', 'CN'));
    }
  }

  void showTip(BuildContext context) {
    CustomToast.text('提示');
    // CustomToast.loading();
    //  CustomToast.dismiss()
    // CustomToast.success('成功');
    // CustomToast.fail('失败');

    // CustomDialog.show<bool>(
    //   context: context,
    //   builder: (BuildContext context) => const Text('确认删除'),
    //   confirm: const Text('确定'),
    //   cancel: const Text('取消'),
    //   onConfirm: () {},
    //   onCancel: Navigator.of(context).pop,
    // );

    // CustomBottomSheet.showArea(
    //   context: context,
    //   items: [AreaModel(label: '广州'), AreaModel(label: '佛山')],
    // );

    // Get.snackbar("title", "message");
    // Get.defaultDialog(
    //   title: "title",
    //   middleText: "this is dialog message",
    //   titleStyle: const TextStyle(color: Colors.blueGrey),
    //   middleTextStyle:
    //       const TextStyle(color: Colors.blueGrey),
    // );
    // Get.bottomSheet(Container(
    //   height: 200,
    //   color: Colors.blueGrey,
    //   child: const Center(
    //     child: Text("bottomSheet"),
    //   ),
    // ));
  }

  void freezedUse() {
    Get.defaultDialog(
      title: "",
      middleText: "看项目freezed_models/content/content.dart文件",
      titleStyle: const TextStyle(color: Colors.blueGrey),
      middleTextStyle: const TextStyle(color: Colors.blueGrey),
    );
    //
    //    // var cont = Content(
    //       id: 111,
    //       name: '',
    //       categoryName: '',
    //       coverPicFullName: '',
    //       viewCount: 2,
    //       favoriteCount: 3);
    //   cont.name = '222';//定义@unfreezed为可变使得name能改变
    //   var cont2 = cont.copyWith(name: '333');//copyWith方法
    //   print(cont == cont2); // 不可变有hashCode方法，可变则没有hashCode方法
    //   var cont3 = Content.fromJson({});//序列化
    //   cont3.toJson();//反序列化
  }

  void hiveUse() {}
}
