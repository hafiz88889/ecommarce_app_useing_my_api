import 'package:ecommarce_myapi/app/routing/app_path.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
class SplashPageView extends StatelessWidget {
  const SplashPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: ElevatedButton(onPressed: (){
            context.push(Routes.PRODUCT_PAGE);
          }, child: Text("Go Product Page")))
        ],
      ),
    );
  }
}
