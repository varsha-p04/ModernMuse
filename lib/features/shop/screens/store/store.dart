import 'package:ModernMuse/features/shop/screens/store/widgets/category_tab.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/appbar/tabbar.dart';
import '../../../../common/widgets/custom_shapes/containers/search_container.dart';

import '../../../../common/widgets/layouts/grid_layout.dart';
import '../../../../common/widgets/brands/brandcard.dart';
import '../../../../common/widgets/texts/section_heading.dart';
import '../../../../data/repositories/brands/brands_shimmer.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../controllers/category_controller.dart';
import '../../controllers/product/brand_controller.dart';
import '../brands/brand_products.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});



  @override
  Widget build(BuildContext context) {
    final brandController = Get.put(BrandController());
    final categories = CategoryController.instance.featuredCategories;
    return DefaultTabController(
      length: categories.length,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Store', style: Theme.of(context).textTheme.headlineMedium),
          actions: [
            //TCartCounterIcon(onPressed: () {}),
          ],
        ),
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [
              SliverAppBar(
                automaticallyImplyLeading: false,
                pinned: true,
                floating: true,
                backgroundColor: THelperFunctions.isDarkMode(context)
                    ? TColors.black
                    : TColors.white,
                expandedHeight: 440,
                flexibleSpace: Padding(
                  padding: const EdgeInsets.all(TSizes.defaultSpace), // Reduced padding if necessary
                  child: ListView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      const SizedBox(height: TSizes.spaceBtwItems),
                      const TSearchContainer(
                        text: 'Search in Store',
                        showBorder: true,
                        showBackground: false,
                        padding: EdgeInsets.zero, // No extra padding
                      ),
                      const SizedBox(height: TSizes.spaceBtwSections),

                      /// Features
                      TSectionHeading(title: 'Featured Brands', onPressed: () {}),
                      const SizedBox(height: TSizes.spaceBtwItems / 1.5),

                      Obx(
                        () {
                          if (brandController.isLoading.value)
                            return TBrandsShimmer();

                          if (brandController.featuredBrands.isEmpty) {
                            return Center(
                                child: Text('No Data Found '
                                    , style: Theme
                                        .of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .apply(color: Colors.white))
                            );
                          }
                          return TGridLayout(
                            itemCount: brandController.featuredBrands.length,
                            mainAxisExtent: 80,
                            itemBuilder: (_, index) {
                              final brand = brandController
                                  .featuredBrands[index];

                              return TBrandCard(
                                showBorder: true, brand: brand, onTap: () => Get.to(() => BrandProducts(brand:brand)),);
                            },
                          );
                        },
                      ),
                  ],
                  ),
                ),
                bottom: TTabBar(tabs: categories.map((category) => Tab(child: Text(category.name))).toList()),
                ),
            ];
          },
          body:  TabBarView(
            children: categories.map((category) => TCategoryTab(category: category)).toList()
          ),
        ),
      ),
    );
  }
}

