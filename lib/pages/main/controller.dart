part of main_page;

class MainController extends GetxController with WidgetsBindingObserver {
  late final PageController pageController;
  int currentPage = 0;

  @override
  void onInit() {
    super.onInit();
    pageController = PageController(initialPage: currentPage);
  }

  void onPageChanged(int page) {
    currentPage = page;
    update(['navigation']);
  }

  @override
  void didChangePlatformBrightness() {
    //跟随系统主题变化
    super.didChangePlatformBrightness();

    // Get.changeThemeMode(Get.isDarkMode ? ThemeMode.dark : ThemeMode.light);
  }

  @override
  void didChangeLocales(List<Locale>? locales) {
    //系统语言发生变化
    super.didChangeLocales(locales);
    // Get.updateLocale(const Locale('en', 'US'));
  }
}
