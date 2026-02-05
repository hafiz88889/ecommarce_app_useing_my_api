import 'package:equatable/equatable.dart';

abstract class SplashEvent extends Equatable{}

class LoadSplashScreen extends SplashEvent{
  LoadSplashScreen();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}