import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../../../../common/widgets/products/add_remove_button.dart';
import '../../../../../common/widgets/products/cart_item.dart';
import '../../../../../common/widgets/texts/product_price_text.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../controllers/product/cart_controller.dart';

class TCartItems extends StatelessWidget {
  const TCartItems({
    super.key, this.showAddRemoveButtons = true,
  });

  final bool showAddRemoveButtons;

  @override
  Widget build(BuildContext context) {
    final cartController = CartController.instance;
    return Obx(
          () =>
          ListView.separated(
            shrinkWrap: true,
            itemCount: cartController.cartItems.length,
            separatorBuilder: (_, __) =>
            const SizedBox(height: TSizes.spaceBtwSections),
            itemBuilder: (_, index) =>
                Obx(
                      () {
                    final item = cartController.cartItems[index];
                    return Column(
                      children: [
                        // Curt Item
                        TCartItem(cartItem: item),
                        if (showAddRemoveButtons)
                          const SizedBox(height: TSizes.spaceBtwItems),
                        // Add Remove Button Row with total Price
                        if (showAddRemoveButtons)
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  // Extra Space
                                  const SizedBox(width: 78),
                                  // Add Remove Buttons
                                  TProductQuantityWithAddRemoveButton(
                                    quantity: item.quantity,
                                    add: () =>
                                        cartController.addOneToCart(item),
                                    remove: () =>
                                        cartController.removeOneFromCart(item),
                                  ), // TProductQuantityWithAddRemoveButton
                                ],
                              ), // Row
                              // Product total price
                              TProductPriceText(
                                price: (item.price * item.quantity)
                                    .toStringAsFixed(1),
                              ),
                            ],
                          ), // Row
                      ],
                    );
                  },
                ),
          ),
    );
  }
}

