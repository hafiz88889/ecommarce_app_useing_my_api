import 'package:ecommarce_myapi/app/main/core/model/request_body.dart';
import 'package:ecommarce_myapi/app/main/models/home_page/model/product_model.dart';
import 'package:equatable/equatable.dart';

enum HomeStatus { initial, success, loading, error }

class HomeState extends Equatable {
  final HomeStatus homeStatus;
  List<ProductModel>? productList;
  final RequestBody? requestBody;
  final String? error;

  HomeState({
    this.homeStatus = HomeStatus.initial,
     this.productList,
     this.requestBody,
     this.error,
  });

  HomeState CopyWith({
    HomeStatus? homeStatus,
    List<ProductModel>? productList,
    RequestBody? requestBody,
    String? error,
  }) {
    return HomeState(
      homeStatus: homeStatus ?? this.homeStatus,
      productList: productList ?? this.productList,
      requestBody: requestBody ?? this.requestBody,
      error: error ?? this.error,
    );
  }

  List<Object?> get props => [homeStatus, productList, requestBody, error];
}
