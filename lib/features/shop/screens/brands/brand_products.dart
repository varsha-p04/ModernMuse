
import 'package:flutter/material.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/brands/brandcard.dart';
import '../../../../common/widgets/products/sortable/sortable_products.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/cloud_helper_functions.dart';
import '../../../../utils/popups/vertical_product_shimmer.dart';
import '../../controllers/product/brand_controller.dart';
import '../../models/brand_model.dart';


class BrandProducts extends StatelessWidget {
  const BrandProducts({super.key, required this.brand});
  final BrandModel brand;


  @override
  Widget build(BuildContext context) {
    final controller = BrandController.instance;
    return Scaffold(
      appBar: TAppBar(title: Text(brand.name)),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [


              TBrandCard(showBorder: true, brand: brand),
              SizedBox(height: TSizes.spaceBtwSections),


              FutureBuilder(
                future: controller.getBrandProducts(brand.id),
                builder: (context, snapshot) {

                  const loader = TVerticalProductShimmer();
                  final widget = TCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot ,loader: loader);
                  if(widget!=null)return widget;
                  final brandProducts = snapshot.data!;
                  return  TSortableProducts(products:brandProducts);
                }
              ),
            ],
          ),
        ),
      ),
    );
  }
}
