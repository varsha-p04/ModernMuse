
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/brands/brandcard.dart';
import '../../../../common/widgets/layouts/grid_layout.dart';
import '../../../../common/widgets/texts/section_heading.dart';
import '../../../../data/repositories/brands/brands_shimmer.dart';
import '../../../../utils/constants/sizes.dart';
import '../../controllers/product/brand_controller.dart';
import 'brand_products.dart';

class AllBrandsScreen extends StatelessWidget {
  const AllBrandsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final brandController = BrandController.instance;
    return Scaffold(
      appBar: const TAppBar(title: Text('Brand'), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              TSectionHeading(
                title: 'Brands',
                showActionButton: false),


              const SizedBox(height: TSizes.spaceBtwItems),
              Obx(
                    () {
                  if (brandController.isLoading.value)
                    return TBrandsShimmer();

                  if (brandController.allBrands.isEmpty) {
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
                          .allBrands[index];

                      return TBrandCard(
                        showBorder: true, brand: brand,onTap: () =>  BrandProducts(brand: brand,),);
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
