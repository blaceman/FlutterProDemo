part of login_page;

class LoginPage extends GetView<LoginController> {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Tools.unfocus(),
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        appBar: AppBar(
          title: Text(SR.login.tr),
        ),
        body: SingleChildScrollView(
          child: SafeArea(
            bottom: false,
            minimum: const EdgeInsets.all(AppTheme.margin),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Project Demo',
                  style: TextStyle(
                    fontSize: 22.w,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 60.h),
                BuildInput(
                  label: Text(SR.phoneNum.tr),
                  controller: controller.phoneInput,
                ),
                SizedBox(height: 30.w),
                Stack(
                  children: [
                    BuildInput(
                      label: Text(SR.code.tr),
                      controller: controller.codeInput,
                    ),
                  ],
                ),
                SizedBox(height: 30.w),
                ElevatedButton(
                  onPressed: () {
                    controller.onLogin();
                  },
                  child: Text(SR.login.tr),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
