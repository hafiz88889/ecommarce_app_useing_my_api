import 'package:ecommarce_myapi/app/main/models/splash_page/bloc/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'event.dart';

class SplashScreenBloc extends Bloc<SplashEvent, SplashScreenStat>{

  SplashScreenBloc():super(SplashScreenStat()){

  }
}