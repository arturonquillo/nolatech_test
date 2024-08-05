enum AppRouteEnum { welcome, login, register, home, reservations, favorites }

extension AppRouteExtension on AppRouteEnum {
  String get name {
    switch (this) {
      case AppRouteEnum.welcome:
        return "/welcome";
      case AppRouteEnum.login:
        return "/login";
      case AppRouteEnum.register:
        return "/register";
      case AppRouteEnum.home:
        return "/home";
      case AppRouteEnum.reservations:
        return "/reservations";
      case AppRouteEnum.favorites:
        return "/favorites";
      default:
        return "/welcome";
    }
  }
}
