import 'package:ecommarce_myapi/app/main/core/constaants/app_constant.dart';
import 'package:ecommarce_myapi/app/main/core/model/common_response_list.dart';
import 'package:ecommarce_myapi/app/main/core/model/common_response_object.dart';
import 'package:ecommarce_myapi/app/main/core/services/custom_http_client.dart';
import 'package:ecommarce_myapi/app/main/models/home_page/bloc/event.dart';
import 'package:ecommarce_myapi/app/main/models/home_page/bloc/state.dart';
import 'package:ecommarce_myapi/app/main/models/home_page/model/product_model.dart';
import 'package:ecommarce_myapi/app/main/models/home_page/services/product_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/model/base_result_model.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState>{
  HomeService homeService = HomeService(http: CustomHttpClient(), url: "${AppConstant.BASE_API_URL}product");
  HomeBloc():super (HomeState()){
    on<LoadHome>((event, emit) async{
      emit (state.CopyWith(homeStatus: HomeStatus.loading));
      try{
       CommonResponseObject<Result<ProductModel>>  responseObject = await homeService.getPageableData(endpoint: 'products', requestBody: event.requestBody, fromJsonT: (json)=>ProductModel.fromJson(json));
       emit (state.CopyWith(homeStatus: HomeStatus.success,productList: responseObject.result?.itemList??[],requestBody:event.requestBody));
      }catch(ex){
        emit(state.CopyWith(homeStatus: HomeStatus.error,error: ex.toString()));
      }
    });
  }
}