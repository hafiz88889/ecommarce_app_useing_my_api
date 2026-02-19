import 'package:ecommarce_myapi/app/main/models/home_page/bloc/bloc.dart';
import 'package:ecommarce_myapi/app/main/models/home_page/bloc/event.dart';
import 'package:ecommarce_myapi/app/main/models/home_page/bloc/state.dart';
import 'package:ecommarce_myapi/app/main/models/home_page/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/model/request_body.dart';

class HomePageView extends StatelessWidget {
  const HomePageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text(
          "Product",
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: BlocBuilder<HomeBloc,HomeState>(builder: (context, state){
        if(state.homeStatus==HomeStatus.initial){
          context.read<HomeBloc>().add(LoadHome(requestBody: RequestBody()));
          //context.read<HomeBloc>().add(LoadHome(requestBody: RequestBody()));
          return CircularProgressIndicator();
        }else if(
        state.homeStatus==HomeStatus.loading){
          return CircularProgressIndicator();
        }else if (state.homeStatus==HomeStatus.success){
          return ListView.builder(
            itemCount: state.productList?.length,
            itemBuilder: (context, index) {
              ProductModel productModel = state.productList![index];
              return Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black,width: 2.0),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
                    ),
                    const SizedBox(height: 8,),
                    Text(productModel.productName??"",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600),)
                  ],
                ),
              );

          },);
        }
        else if (state.homeStatus == HomeStatus.error) {
          return Center(child: Text(state.error ?? "Something went wrong"));
        }
        return const SizedBox.shrink();
      })
    );
  }
}
