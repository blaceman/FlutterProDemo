part of routers;

abstract class Routers {
  static const String main = "/mainPage";
  static const String login = "/login";
  static const String mine = "/mine";

  static final List<GetPage> getPages = [
    GetPage(
      name: main,
      page: () => const mainPage(),
    )
  ];
}
