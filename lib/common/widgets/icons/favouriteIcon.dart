
import 'package:ModernMuse/common/widgets/icons/t_circular_icon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../utils/constants/colors.dart';
import '../../../features/authentication/controllers/favourites_controller.dart';



class TFavouriteIcon extends StatelessWidget {
  const TFavouriteIcon({
    super.key,
    required this.productId,
  });


  final String productId;


  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FavouritesController());
    return Obx(
          () => TCircularIcon(
        icon: controller.isFavourite(productId)
            ? Iconsax.heart5
            : Iconsax.heart,
        color: controller.isFavourite(productId)
            ? TColors.error
            : null,
        onPressed: () => controller.toggleFavoriteProduct(productId),
      ),
    );
  }
}
