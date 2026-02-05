import 'package:ecommarce_myapi/app/main/core/model/request_body.dart';
import 'package:equatable/equatable.dart';

abstract class HomeEvent extends Equatable{}

class LoadHome extends HomeEvent{
   final RequestBody requestBody;
   LoadHome({required this.requestBody});
  List<Object?> get props => [requestBody];
}