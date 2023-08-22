enum AppRoutes {
  root,
  login,
  forgot,
  Register,
  Home,
  VideoList,
  FormScreen,
  ProfileScreen,
  Approvel,
  Project,
  TaskProjectList,
  TaskAssigned,
}

extension AppRouteExtension on AppRoutes {
  static const appRoutes = {
    AppRoutes.root: "/",
    AppRoutes.login: "/login",
    AppRoutes.forgot: "/forgot",
    AppRoutes.Register: "/Register",
    AppRoutes.Home: "/Home",
    AppRoutes.VideoList: "/VideoList",
    AppRoutes.FormScreen: "/FormScreen",
    AppRoutes.ProfileScreen: "/Profile",
    AppRoutes.TaskProjectList: "/TaskProjectList",
    AppRoutes.TaskAssigned: "/TaskAssigned",
  };

  String get toName => appRoutes[this]!;
}

enum ApiRoutes {
  login,
}

extension ApiRouteExtension on ApiRoutes {
  static const apiRoutes = {
    ApiRoutes.login: "",
  };

  String get toName => apiRoutes[this]!;
}
