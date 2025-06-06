
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../common/widgets/chips/choice_chip.dart';
import '../../../../../common/widgets/custom_shapes/containers/rounded_container.dart';
import '../../../../../common/widgets/texts/product_price_text.dart';
import '../../../../../common/widgets/texts/product_title_text.dart';
import '../../../../../common/widgets/texts/section_heading.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_functions.dart';
import '../../../../authentication/controllers/variation_controller.dart';
import '../../../models/product_model.dart';

class TProductAttributes extends StatelessWidget {
  const TProductAttributes({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VariationController());
    final dark = THelperFunctions.isDarkMode(context);

    return Obx(
      () => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// -- Selected Attribute Pricing & Description
          if (controller.selectedVariation.value.id.isNotEmpty)
            TRoundedContainer(
              backgroundColor: dark ? TColors.darkerGrey : TColors.grey,
              child: Padding(
                padding: EdgeInsets.all(TSizes.padding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// Title, Price and Stock Status
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const TSectionHeading(
                          title: 'Variation',
                          showActionButton: false,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                const TProductTitleText(
                                  title: 'Price',
                                  smallSize: true,
                                ),
                                Text(
                                  '\$${controller.getVariationPrice()}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall!
                                      .apply(
                                          decoration: TextDecoration.lineThrough),
                                ),
                                const SizedBox(width: TSizes.spaceBtwItems),
                                 TProductPriceText(price: controller.getVariationPrice()),
                              ],
                            ),
                            Row(
                              children: [
                                const TProductTitleText(
                                  title: 'Stock',
                                  smallSize: true,
                                ),
                                Text(
                                  controller.variationStockStatus.value,
                                  style: Theme.of(context).textTheme.titleMedium,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: TSizes.spaceBtwItems),

                    /// Variation Description
                    const TProductTitleText(
                      title:
                          'This is the Description of the Product and it can go up to max 4 lines.',
                      smallSize: true,
                      maxLines: 4,
                    ),
                  ],
                ),
              ),
            ),
          const SizedBox(height: TSizes.spaceBtwItems),

          /// -- Attributes
          ///
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: product.productAttributes!
                .map((attribute) => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TSectionHeading(
                            title: attribute.name ?? '', showActionButton: false),
                        const SizedBox(height: TSizes.spaceBtwItems / 2),
                        Obx(
                        ()=> Wrap(
                              spacing: 8,
                              children: attribute.values!.map((attributeValue) {
                                final isSelected =
                                    controller.selectedAttributes[attribute.name] ==
                                        attributeValue;
                                final available = controller
                                    .getAttributesAvailabilityInVariation(
                                        product.productVariations!, attribute.name!)
                                    .contains(attributeValue);

                                return TChoiceChip(
                                    text: attributeValue,
                                    selected: isSelected,
                                    onSelected: available
                                        ? (selected) {
                                            if (selected && available) {
                                              controller.onAttributeSelected(
                                                  product,
                                                  attribute.name ?? '',
                                                  attributeValue);
                                            }
                                          }
                                        : null);
                              }).toList()),
                        )
                      ],
                    ))
                .toList(),
          ),
        ],
      ),
    );
  }
}
