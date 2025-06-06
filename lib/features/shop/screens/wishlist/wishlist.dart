
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/icons/t_circular_icon.dart';
import '../../../../common/widgets/layouts/grid_layout.dart';
import '../../../../common/widgets/loaders/animation_loader.dart';
import '../../../../common/widgets/products/product_cards/product_card_vertical.dart';
import '../../../../navigation_menu.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/cloud_helper_functions.dart';
import '../../../../utils/popups/vertical_product_shimmer.dart';
import '../../../authentication/controllers/favourites_controller.dart';
import '../home/home.dart';




class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});


  @override
  Widget build(BuildContext context) {
    final controller = FavouritesController.instance;


    return Scaffold(
      appBar: TAppBar(
        title: Text(
          'Wishlist',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        actions: [
          TCircularIcon(
            icon: Iconsax.add,
            onPressed: () => Get.to(const HomeScreen()),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),

          child: Obx(
                () => FutureBuilder(
              future: controller.favoriteProducts(),
              builder: (context, snapshot) {
                final emptyWidget = TAnimationLoaderWidget(
                  text: 'Whoops! Wishlist is Empty...',
                animation: TImages.docerAnimation,
                  showAction: true,
                  actionText: 'Let\'s add some',
                  onActionPressed: () => Get.off(() => const NavigationMenu()),
                );


                const loader = TVerticalProductShimmer(itemCount: 6);


                final widget = TCloudHelperFunctions.checkMultiRecordState(
                  snapshot: snapshot,
                  loader: loader,
                  nothingFound: emptyWidget,
                );


                if (widget != null) return widget;


                final products = snapshot.data!;


                return TGridLayout(
                  itemCount: products.length,
                  itemBuilder: (_, index) => TProductCardVertical(
                    product: products[index],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
