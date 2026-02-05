import 'package:ecommarce_myapi/app/routing/app_router.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: "Ecommarce Using My APi",
      routerConfig: AppRouter.appRoute,
    );
  }
}
