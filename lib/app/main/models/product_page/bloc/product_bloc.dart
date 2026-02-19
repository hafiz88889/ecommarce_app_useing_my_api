import 'package:ecommarce_myapi/app/main/models/product_page/bloc/product_event.dart';
import 'package:ecommarce_myapi/app/main/models/product_page/bloc/product_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/constaants/app_constant.dart';
import '../../../core/services/custom_http_client.dart';
import '../services/product_services.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState>{
  ProductServices productServices =ProductServices(
    http: CustomHttpClient(),
    url: "${AppConstant.BASE_API_URL}",);
  ProductBloc():super(ProductState()){
    on<LoadProduct>((event, emit) async {
      emit(state.copyWith(productStatus: ProductStatus.loading));
      try {
        final productList = await productServices.getProducts();
        emit(state.copyWith(
          productStatus: ProductStatus.success,
          productList: productList,
        ));
      } catch (ex) {
        emit(state.copyWith(productStatus: ProductStatus.error, error: ex.toString()));
      }
    });


  }
}