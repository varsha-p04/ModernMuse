
import 'package:ModernMuse/features/shop/screens/product_details/widgets/bottom_add_to_cart_widget.dart';
import 'package:ModernMuse/features/shop/screens/product_details/widgets/product_attributes.dart';
import 'package:ModernMuse/features/shop/screens/product_details/widgets/product_detail_image_slider.dart';
import 'package:ModernMuse/features/shop/screens/product_details/widgets/product_meta_data.dart';
import 'package:ModernMuse/features/shop/screens/product_details/widgets/rating_share_widget.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';

import '../../../../common/widgets/texts/section_heading.dart';
import '../../../../utils/constants/enums.dart';
import '../../../../utils/constants/sizes.dart';
import '../../models/product_model.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: TBottomAddToCart(product : product),
        body: SingleChildScrollView(
    child: Column(
    children: [
        // 1-Product Image Slider
        TProductImageSlider(product: product),
    // 2- Product Details
    Padding(
    padding: EdgeInsets.only(
    right: TSizes.defaultSpace,
    left: TSizes.defaultSpace,
    bottom: TSizes.defaultSpace),
    child: Column(
    children: [
    // - Roting & Share Button
    TRatingAndShare(),


    // - Price, Title, Stock & Brand
    TProductMetaData(product: product),


    // -- Attributes
    if(product.productType == ProductType.variable.toString())  TProductAttributes(product: product),
      if(product.productType == ProductType.variable.toString()) const SizedBox(height: TSizes.spaceBtwSections),


    // Checkout Button
    SizedBox(width: double.infinity, child: ElevatedButton(onPressed: (){}, child: Text('checkout'))),
     const SizedBox(height: TSizes.spaceBtwSections),


    // Description
    const TSectionHeading(title: 'Description', showActionButton: false),
    const SizedBox(width: TSizes.spaceBtwItems),
    ReadMoreText(
    product.description ?? '',
    trimLines: 2,
    trimMode: TrimMode.Line,
    trimCollapsedText: 'Show more',
    trimExpandedText: 'Less',
    moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
    lessStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
    ),


    // - Reviews
    const Divider(),
    const SizedBox(height: TSizes.spaceBtwItems),
    Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
    const TSectionHeading(title: 'Reviews (199)', showActionButton: false),
    IconButton(icon: const Icon(Iconsax.arrow_right_3, size: 18), onPressed: () {} ),
    ],
    ),
     SizedBox(height: TSizes.spaceBtwSections),
    ],
    ),
    ),
    ],
    )
    ,
    )
    ,
    );
  }
}



