part of home_page;

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: HomeController(),
        builder: ((controller) => Scaffold(
              appBar: AppBar(
                title: Text(SR.home.tr),
              ),
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (GlobalService.to.isLogin)
                      Text(
                        GlobalService.to.userModel.phoneNum!,
                        style: TextStyle(fontSize: 16.sp),
                      ),
                    SizedBox(height: 16.h),
                    ElevatedButton(
                        onPressed: () {
                          if (!GlobalService.to.isLogin) {
                            Get.toNamed(Routers.login);
                          }
                        },
                        style: ButtonStyle(
                            backgroundColor: GlobalService.to.isLogin
                                ? MaterialStateProperty.all(Colors.grey)
                                : MaterialStateProperty.all(AppTheme.primary)),
                        child: Text(GlobalService.to.isLogin
                            ? SR.alreadyLogin
                            : SR.login.tr)),
                  ],
                ),
              ),
            )));
  }
}
