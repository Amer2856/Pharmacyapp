import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_app_template/index.dart';
import 'package:flutter_bloc_app_template/view/main.dart';
import 'package:flutter_bloc_app_template/view/splash_view.dart';

class NavDestination {
  const NavDestination({
    required this.screen,
    required this.label,
    required this.icon,
    this.child,
  });

  final Widget screen;
  final String label;
  final Icon icon;
  final Widget? child;
}

const List<NavDestination> destinations = [
  NavDestination(
    label: 'Home',
    icon: Icon(Icons.home),
    screen: EmailListScreen(),
  ),
  NavDestination(
    label: 'Widgets',
    icon: Icon(Icons.widgets),
    screen: WidgetListScreen(),
  ),
  NavDestination(
    label: 'Settings',
    icon: Icon(AppIcons.toolbarSettings),
    screen: Settings(),
  ),
];

class Routes {
  static const app = 'home';
}

final GlobalKey<NavigatorState> appNavigatorKey = GlobalKey<NavigatorState>();

class NavigationService {
  final _appRoutes = {
    Routes.app: (_) => const MainPage(),
  };

  // iOS: full screen routes pop up from the bottom and disappear vertically too
  // On iOS that's a standard full screen dialog
  // Has no effect on Android.
  final Set<String> _fullScreenRoutes = {};

  // iOS transition: Pages that slides in from the right and exits in reverse.
  final Set<String> _cupertinoRoutes = {};

  static NavigationService of(BuildContext context) =>
      RepositoryProvider.of<NavigationService>(context);

  Future<dynamic> navigateTo(
    String routeName, [
    Object? arguments,
    bool replace = false,
    final VoidCallback? onPressed,
  ]) async {
    if (_appRoutes[routeName] != null) {
      return replace
          ? appNavigatorKey.currentState
              ?.pushReplacementNamed(routeName, arguments: arguments)
              .then(
                (value) => onPressed?.call(),
              )
          : appNavigatorKey.currentState
              ?.pushNamed(routeName, arguments: arguments)
              .then(
                (value) => {onPressed?.call()},
              );
    }
  }

  Future<dynamic> navigateToWithCallback(
    String routeName,
    final VoidCallback? onPressed,
    Object? arguments,
  ) async {
    if (_appRoutes[routeName] != null) {
      return appNavigatorKey.currentState
          ?.pushNamed(routeName, arguments: arguments)
          .then(
            (value) => onPressed,
          );
    }
  }

  Route<dynamic> onGenerateRoute(RouteSettings settings) {
    return _appRoutes[settings.name!] != null
        ? _cupertinoRoutes.contains(settings.name)
            ? CupertinoPageRoute(
                settings: settings,
                builder: (_) => _appRoutes[settings.name]!(settings.arguments),
                fullscreenDialog: _fullScreenRoutes.contains(settings.name),
              )
            : MaterialPageRoute(
                settings: settings,
                builder: (_) => _appRoutes[settings.name]!(settings.arguments),
                fullscreenDialog: _fullScreenRoutes.contains(settings.name),
              )
        : MaterialPageRoute(builder: (_) => const SplashView());
  }

  Future<dynamic> pushAndRemoveAll(
    String routeName, [
    Object? arguments,
  ]) async {
    return appNavigatorKey.currentState
        ?.pushNamedAndRemoveUntil(routeName, (route) => false);
  }

  String? currentRouteName() {
    String? currentPath;
    appNavigatorKey.currentState?.popUntil((route) {
      currentPath = route.settings.name;

      return true;
    });

    return currentPath;
  }

  Future<dynamic> pushAndRemoveUntil({
    required String route,
    required String from,
    Object? arguments,
  }) async {
    return appNavigatorKey.currentState
        ?.pushNamedAndRemoveUntil(route, ModalRoute.withName(from));
  }
}
