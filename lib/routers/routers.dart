part of routers;

abstract class Routers {
  static const String main = "/mainPage";
  static const String login = "/login";
  static const String mine = "/mine";
  static const String home = "/home";

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
  ];
}
