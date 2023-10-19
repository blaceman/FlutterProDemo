part of user_info_page;

class UserInfoPage extends GetView<UserInfoController> {
  const UserInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(SR.userInfo.tr),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              controller.phoneStr,
            ),
            // Obx(() => Text(controller.phoneStr)),
            SizedBox(height: 16.h),
            Text(controller.codeStr)
            // Obx(() => Text(controller.codeStr)),
          ],
        ),
      ),
    );
  }
}
