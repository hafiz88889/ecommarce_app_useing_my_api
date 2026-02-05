import 'package:go_router/go_router.dart';

import 'app_path.dart';

class AppRouter {
  AppRouter._();

  static final GoRouter appRoute = GoRouter(
    initialLocation: Routes.INITIAL,
    routes: [
      GoRoute(path: Routes.INITIAL,
      )
    ],
  );
}
