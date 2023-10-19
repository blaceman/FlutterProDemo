part of routers;

abstract class Routers {
  static const String main = "/mainPage";
  static const String login = "/login";
  static const String mine = "/mine";
  static const String home = "/home";
  static const String userInfo = "/user_info";
  static const String download = "/download";

  static final List<GetPage> getPages = [
    GetPage(
      name: main,
      page: () => const MainPage(),
    ),
    GetPage(
      name: home,
      page: () => const HomePage(),
    ),
    GetPage(
      name: mine,
      page: () => const MinePage(),
    ),
    GetPage(
      name: login,
      page: () => const LoginPage(),
      binding: LoginControllerBinding(),
    ),
    GetPage(
      name: userInfo,
      page: () => const UserInfoPage(),
      binding: UserInfoControllerBinding(),
      middlewares: [LoginMiddleware()],
    ),
    GetPage(
      name: download,
      page: () => const MyDownLoadPage(),
      binding: MyDownloadControllerBinding(),
    ),
  ];
}
