import 'package:ecommarce_myapi/app/main/models/home_page/view/home_page_view.dart';
import 'package:ecommarce_myapi/app/main/models/splash_page/view/splash_page_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../main/models/splash_page/bloc/bloc.dart';
import 'app_path.dart';

class AppRouter {
  AppRouter._();

  static final GoRouter appRoute = GoRouter(
    initialLocation: Routes.INITIAL,
    routes: [
      GoRoute(path: Routes.INITIAL,
      builder: (context,state)=>SplashPageView(),
      ),
      GoRoute(path: Routes.INITIAL,
        builder: (context, state)=>BlocProvider(create: (context)=>SplashScreenBloc(),
        child: SplashPageView(),
        ),
      ),
      GoRoute(path: Routes.HOME,
        builder: (context, state)=>BlocProvider(create: (context)=>SplashScreenBloc(),
        child: HomePageView(),
        ),
      ),

    ],
  );
}
