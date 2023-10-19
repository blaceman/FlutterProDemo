part of mine_page;

class MinePage extends StatelessWidget {
  const MinePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: MineController(),
        builder: (controller) => Scaffold(
              appBar: AppBar(
                title: Text(SR.mine.tr),
              ),
              body: SingleChildScrollView(
                child: CustomCellGroup(
                  isInset: false,
                  children: [
                    CustomCell(
                      title: Text(SR.changeTheme.tr),
                      onTap: () {
                        controller.changeTheme();
                      },
                    ),
                    CustomCell(
                      title: Text(SR.changeLanguage.tr),
                      value: const Text(''),
                      onTap: () async {
                        controller.changeLanguage();
                        // CustomToast.success('清除缓存成功');
                        // CacheUtils.clearApplicationCache();
                        // await CacheUtils.clearApplicationCache();
                      },
                    ),
                    CustomCell(
                      title: Text(SR.userInfo.tr),
                      onTap: () {
                        Get.toNamed(Routers.userInfo);
                      },
                    ),
                    CustomCell(
                        title: Text(SR.someTip.tr),
                        onTap: () {
                          controller.showTip(context);
                        }),
                    CustomCell(
                      title: Text(SR.download.tr),
                      onTap: () {
                        Get.toNamed(Routers.download);
                      },
                    ),
                    // CustomCell(title: const Text('用户协议'), onTap: () {}),
                  ],
                ),
              ),
              bottomNavigationBar: !GlobalService.to.isLogin
                  ? null
                  : CustomBottomAppBar(
                      child: CustomButton(
                        child: Text(SR.outLogin.tr),
                        onPressed: () {
                          CustomDialog.show<bool>(
                            context: context,
                            builder: (BuildContext context) =>
                                const Text('确认退出登录吗？'),
                            confirm: const Text('确定'),
                            cancel: const Text('取消'),
                            onConfirm: () {
                              GlobalService.to.removeUser();
                              Get.until((route) => route.isFirst);
                              controller.updateUI();
                            },
                            onCancel: () {
                              Get.back();
                            },
                          );
                        },
                      ),
                    ),
            ));
  }
}
