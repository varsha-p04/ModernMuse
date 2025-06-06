
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../common/widgets/images/t_rounded_image.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_functions.dart';
import '../../../../features/shop/controllers/product_controller.dart';
import '../../../../features/shop/models/product_model.dart';
import '../../../../features/shop/screens/product_details/product_details.dart';
import '../../../../features/shop/screens/product_details/widgets/add_to_cart_button.dart';
import '../../../styles/shadows.dart';
import '../../custom_shapes/containers/rounded_container.dart';
import '../../icons/favouriteIcon.dart';
import '../../texts/product_price_text.dart';
import '../../texts/product_title_text.dart';
import '../../texts/t_brand_title_test_with_verified_icon.dart';




class TProductCardVertical extends StatelessWidget {
  const TProductCardVertical({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final controller = ProductController.instance;
    final salePercentage = controller.calculateSalePercentage(product.price, product.salePrice);
    final dark = THelperFunctions.isDarkMode(context);

    return GestureDetector(
      onTap: () => Get.to(() => ProductDetailScreen(product: product)),
      child: Container(
        width: 180,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          boxShadow: [TShadowStyle.verticalProductShadow],
          borderRadius: BorderRadius.circular(TSizes.productImageRadius),
          color: dark ? TColors.darkerGrey : TColors.white,
        ),
        child: Column(
          children: [
            TRoundedContainer(
              height: 180,
              padding: const EdgeInsets.all(TSizes.sm),
              backgroundColor: dark ? TColors.dark : TColors.light,
              child: Stack(
                children: [
                  TRoundedImage(imageUrl: product.thumbnail, applyImageRadius: true, isNetworkImage: true),
                  if(salePercentage != null)
                  Positioned(
                    top: 12,
                    child: TRoundedContainer(
                      radius: TSizes.sm,
                      backgroundColor: TColors.secondary.withOpacity(0.8),
                      padding: const EdgeInsets.symmetric(horizontal: TSizes.sm, vertical: TSizes.xs),
                      child: Text(
                        '$salePercentage%',
                        style: Theme.of(context).textTheme.labelLarge!.apply(color: TColors.black),
                      ),
                    ),
                  ),


                  Positioned(
                    top: 0,
                      right: 0,
                      child: TFavouriteIcon(productId: product.id),
                  ),
                ],
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwItems / 2),
            Padding(
              padding: const EdgeInsets.only(left: TSizes.sm, right: TSizes.sm), // Adjust right padding to shift content left
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TProductTitleText(title: product.title, smallSize: true),
                  const SizedBox(height: TSizes.spaceBtwItems / 2),
                  TBrandTitleWithVerifiedIcon(title: product.brand!.name),
                ],
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: TSizes.sm),
                        child: TProductPriceText(price: controller.getProductPrice(product)),
                      ),
                    ],
                  ),
                ),
                ProductCardAddToCartButton(product : product),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

