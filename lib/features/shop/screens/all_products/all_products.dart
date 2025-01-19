import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/products/sortable/sortable_products.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/cloud_helper_functions.dart';
import '../../../../utils/popups/vertical_product_shimmer.dart';
import '../../controllers/product/all_product_controller.dart';
import '../../models/product_model.dart';

class AllProducts extends StatelessWidget {
  const AllProducts(
      {super.key, required this.title, this.query, this.futureMethod});

  final String title;
  final Query? query;
  final Future<List<ProductModel>>? futureMethod;

  @override
  Widget build(BuildContext context) {
// Initialize controller for managing product fetching
    final controller = Get.put(AllProductsController());
    return Scaffold(
      /// AppBar
      appBar: TAppBar(title: Text(title), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: FutureBuilder(
              future: futureMethod ?? controller.fetchProductsByQuery(query),
              builder: (context, snapshot) {

                const loader = TVerticalProductShimmer();
               final widget = TCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot,loader: loader);

               if(widget != null) return widget;

                final products = snapshot.data!;
                return  TSortableProducts(products: products);
              }), // FutureBuilder
        ), // Padding
      ), // SingleChildScrollView
    ); // Scaffold
  }
}
