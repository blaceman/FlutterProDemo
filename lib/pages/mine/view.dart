part of mine_page;

class MinePage extends StatelessWidget {
  const MinePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: MineController(),
        builder: (controller) => Scaffold(
              appBar: AppBar(
                title: const Text('我的'),
              ),
              body: SingleChildScrollView(
                child: CustomCellGroup(
                  isInset: false,
                  children: [
                    CustomCell(
                      title: const Text('账号与安全'),
                      onTap: () {},
                    ),
                    CustomCell(
                      title: const Text('清除缓存'),
                      value: const Text(''),
                      onTap: () async {
                        // Handle clearing cache here
                        CustomToast.success('清除缓存成功');
                        // CacheUtils.clearApplicationCache();
                        await CacheUtils.clearApplicationCache();
                      },
                    ),
                    const CustomCell(
                      title: Text('版本信息'),
                      value: Text('1.0.1'),
                    ),
                    CustomCell(title: const Text('网络诊断'), onTap: () {}),
                    CustomCell(title: const Text('隐私政策'), onTap: () {}),
                    CustomCell(title: const Text('用户协议'), onTap: () {}),
                  ],
                ),
              ),
              bottomNavigationBar: !GlobalService.to.isLogin
                  ? null
                  : CustomBottomAppBar(
                      child: CustomButton(
                        child: const Text('退出登录'),
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
