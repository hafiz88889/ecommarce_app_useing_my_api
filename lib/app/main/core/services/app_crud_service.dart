


import 'package:flutter/widgets.dart';

import '../../../utils/SharedPreferencesHelper.dart';
import '../model/base_result_model.dart';
import '../model/common_response_list.dart';
import '../model/common_response_object.dart';
import '../model/request_body.dart';
import 'custom_http_client.dart';


 class AppCrudService<T>{
   final CustomHttpClient httpClient;
   final String uri;
  AppCrudService({required  this.httpClient,required this.uri});

   Future<CommonResponseList<T>> getDataList(T Function(Map<String, dynamic>) fromJsonT)async{
   final response = await httpClient.get(uri: uri);
    return CommonResponseList<T>.fromJson(response,fromJsonT);
  }
   Future<CommonResponseObject<T>> getDataObject(T Function(Map<String, dynamic>) fromJsonT) async{
   final response = await httpClient.get(uri: uri);
   return CommonResponseObject<T>.fromJson(response, fromJsonT);
 }
   Future<CommonResponseObject<T>> getDataObjectById({required String id,required T Function(Map<String, dynamic>) fromJsonT}) async{
     final response = await httpClient.get(uri: "$uri/$id");
     return CommonResponseObject<T>.fromJson(response, fromJsonT);
   }

   Future<CommonResponseObject<Result<T>>> getPageableData({required String endpoint, required RequestBody requestBody,required T Function(Map<String, dynamic>) fromJsonT}) async{
     final response = await httpClient.post(uri: "$uri$endpoint", data: requestBody.toJson(),token: await SharedPreferencesHelper.getToken());
    debugPrint("Pageable Response : $response");
     return CommonResponseObject<Result<T>>.fromJson(response, (resultJson) => Result.fromJson(resultJson, fromJsonT),);
   }

   Future<CommonResponseObject<String>> saveInfo({required Map<String,dynamic> body,required String endPoint}) async{
     final response = await httpClient.post(uri: "$uri$endPoint", data: body,token: await SharedPreferencesHelper.getToken());
     print(response);
     return CommonResponseObject<String>.fromJson(response,(resultJson) => resultJson as String) ;
   }

   // Future<CommonResponseObject<String>> updateInfo({required T object,required String endPoint}) async{
   //   final response = await httpClient.post(uri: "$uri$endPoint", data: object.toJson(),token: await SharedPreferencesHelper.getToken());
   //   print(response);
   //   return CommonResponseObject<String>.fromJson(response,(resultJson) => resultJson as String) ;
   // }


}