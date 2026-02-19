import 'package:equatable/equatable.dart';

import '../../../core/model/request_body.dart';
import '../../home_page/model/product_model.dart';

enum ProductStatus { inital, loading, success, error, onData }

class ProductState extends Equatable {
  final ProductStatus productStatus;
  final List<ProductModel>? productList;
  final RequestBody? requestBody;
  final int? totalCount;
  final String? error;

  ProductState({
    this.productStatus = ProductStatus.inital,
    this.requestBody,
    this.error,
    this.totalCount,
    this.productList,
  });
  ProductState copyWith({
    ProductStatus? productStatus,
    List<ProductModel>? productList,
    RequestBody? requestBody,
    int? totalCount,
    String? error,
  }){
    return ProductState(
      productStatus: productStatus ?? this.productStatus,
      productList: productList ?? this.productList,
      requestBody: requestBody ?? this.requestBody,
      error: error ?? this.error,
      totalCount: totalCount ?? this.totalCount,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
    productList,
    productStatus,
    requestBody,
    totalCount,
    error,
  ];
}
