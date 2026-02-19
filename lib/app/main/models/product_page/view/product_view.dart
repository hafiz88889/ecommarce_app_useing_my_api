import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../core/model/request_body.dart';
import '../bloc/product_bloc.dart';
import '../bloc/product_event.dart';
import '../bloc/product_state.dart';
class ProductView extends StatelessWidget {
  const ProductView({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController searchController=TextEditingController();
    return Scaffold(
      backgroundColor: Color(0xFF2D3748),
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(150),
          child: AppBar(
            backgroundColor: Color(0xFF2D3748),
            flexibleSpace:   Padding(
              padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
              child: SafeArea(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        IconButton(onPressed: (){
                        }, icon: Icon(Icons.arrow_back,color: Colors.white,),),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Text(
                              'Product Page',
                              style: const TextStyle(
                                fontSize: 24, // Optional: reduce size a bit if needed
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),

                        // Add Button
                        InkWell(
                          onTap: () {
                          },
                          borderRadius: BorderRadius.circular(22),
                          child: Container(
                            width: 44,
                            height: 44,
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                colors: [
                                  Color(0xFF667EEA),
                                  Color(0xFF764BA2),
                                ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                              borderRadius: BorderRadius.circular(22),
                              boxShadow: [
                                BoxShadow(
                                  color: const Color(0xFF667EEA).withOpacity(0.4),
                                  blurRadius: 12,
                                  offset: const Offset(0, 4),
                                ),
                              ],
                            ),
                            child: const Icon(
                              Icons.shopping_cart,
                              color: Colors.white,
                              size: 24,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10,),
                    TextField(
                      controller: searchController,
                      decoration: InputDecoration(
                          hintText: "Search Product...",
                          fillColor: Colors.white,
                          filled: true,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(width: 1,color: Colors.black)
                          )
                      ),
                      onChanged: (value) {
                        context.read<ProductBloc>().add(LoadProduct(requestBody: RequestBody(filter: searchController.text)));
                      },
                    ),
                  ],
                ),
              ),
            ),
          )),
      body: RefreshIndicator(
        onRefresh: () => _onRefresh(context: context),
        child: BlocBuilder<ProductBloc, ProductState>(
          builder: (context, state) {
            if (state.productStatus == ProductStatus.inital) {
              context.read<ProductBloc>().add(
                LoadProduct(requestBody: RequestBody()),
              );
              return const Center(child: CircularProgressIndicator());
            } else if (state.productStatus == ProductStatus.loading) {
              return const Center(
                child: Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: CircularProgressIndicator()
                ),);
            } else if (state.productStatus == ProductStatus.success) {
              return   ListView.builder(
                itemCount: state.productList?.length ?? 0,
                itemBuilder: (context, index) {
                  final productItem = state.productList![index];
                  return Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 10,
                    ),
                    margin: EdgeInsets.symmetric(horizontal: 12, vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          blurRadius: 5,
                          spreadRadius: 3,
                          offset: const Offset(3, 3),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                         // Image.network("${productItem.image}",height: MediaQuery.of(context).size.height/4,width: double.infinity,),
                          const SizedBox(height: 10,),
                          Text("${productItem.productName}",style: TextStyle(
                              fontSize: 24,color: Colors.black,fontWeight: FontWeight.w700),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 8,),
                          // Row(
                          //   children: [
                          //     Expanded(
                          //       child: Text(
                          //         "Price : ${productItem.price} Taka",
                          //         style: TextStyle(
                          //           fontSize: 16,
                          //           color: Colors.black,
                          //           fontWeight: FontWeight.w600,
                          //         ),
                          //       ),
                          //     ),
                          //     SizedBox(width: 12),
                          //     RatingBarIndicator(
                          //       rating: productItem.rating?.rate ?? 0,
                          //       itemBuilder: (context, index) => Icon(
                          //         Icons.star,
                          //         color: Colors.amber,
                          //       ),
                          //       itemCount: 5,
                          //       itemSize: 20,
                          //     ),
                          //
                          //     SizedBox(width: 6),
                          //
                          //     // Rating Number (ex: 3.9)
                          //     Text(
                          //       "${productItem.rating?.rate ?? 0}",
                          //       style: TextStyle(
                          //         fontSize: 16,
                          //         color: Colors.black,
                          //         fontWeight: FontWeight.w600,
                          //       ),
                          //     ),
                          //   ],
                          // ),
                          const SizedBox(height: 20),
                          Row(
                            children: [
                              Expanded(child: ElevatedButton(onPressed: (){},
                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadiusGeometry.circular(15)
                                    ),
                                    backgroundColor: Colors.amber,
                                    minimumSize: Size(0, 50),
                                  ),
                                  child: Text("Add To Cart",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w700),))),
                              const SizedBox(width: 10,),
                              Expanded(child: ElevatedButton(onPressed: (){},
                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadiusGeometry.circular(15)
                                    ),
                                    backgroundColor: Colors.green,
                                    minimumSize: Size(0, 50),
                                  ),
                                  child: Text("Buy Now",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w700)))),
                            ],
                          )
                        ]
                    ),
                  );
                },
              );
            } else if (state.productStatus == ProductStatus.error) {
              return Center(child: Text(state.error ?? "Something went wrong"));
            }
            return const SizedBox.shrink();
          },
        ),
      ),

    );

  }
  Future<void>_onRefresh({required BuildContext context})async {
    context.read<ProductBloc>().add(LoadProduct(requestBody: RequestBody(),));
  }
  // Widget _buildInfoBox(String label, String value) {
  //   return   Container(
  //     padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 5),
  //     decoration: BoxDecoration(
  //       color: const Color(0xFFF7FAFC),
  //       borderRadius: BorderRadius.circular(12),
  //     ),
  //     child: Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       mainAxisAlignment: MainAxisAlignment.center,
  //       children: [
  //         Text(
  //           label,
  //           style: TextStyle(
  //             fontSize: 10,
  //             fontWeight: FontWeight.w700,
  //             color: const Color(0xFF718096),
  //             letterSpacing: 0.5,
  //           ),
  //         ),
  //         const SizedBox(height: 6),
  //         Text(
  //           value,
  //           style: const TextStyle(
  //             fontSize: 14,
  //             fontWeight: FontWeight.w600,
  //             color: Color(0xFF2D3748),
  //           ),
  //           maxLines: 1,
  //           overflow: TextOverflow.ellipsis,
  //         ),
  //       ],
  //     ),
  //   );
  // }

}
