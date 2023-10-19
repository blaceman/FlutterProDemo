part of services;

class LoginMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    if (!GlobalService.to.isLogin) {
      return const RouteSettings(name: Routers.login);
    }
    return super.redirect(route);
  }
}
