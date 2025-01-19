
import 'package:ModernMuse/features/authentication/screens/onboarding/widgets/onboarding_dot_navigation.dart';
import 'package:ModernMuse/features/authentication/screens/onboarding/widgets/onboarding_page.dart';
import 'package:ModernMuse/features/authentication/screens/onboarding/widgets/onboarding_skip.dart';
import 'package:ModernMuse/features/authentication/screens/onboarding/widgets/onboardingnextbutton.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/text_strings.dart';
import '../../controllers/controllers.onboarding/onboarding_controller.dart';


class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnBoardingController());
    return Scaffold(
      body: Stack(
        children: [
          /// Horizontal Scrollable Pages
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children: const [
              OnBoardingPage(image: TImages.OnBoardingImage1,
                title: TTexts.onBoardingTitle1,
                subTitle: TTexts.onBoardingSubTitle1,
              ), // OnBoarding Page
              OnBoardingPage (
                image: TImages.OnBoardingImage2,
                title: TTexts.onBoardingTitle2,
                subTitle: TTexts.onBoardingSubTitle2,
              ), // OnBoarding Page
              OnBoardingPage (
                image: TImages.OnBoardingImage3,
                title: TTexts.onBoardingTitle3,
                subTitle: TTexts.onBoardingSubTitle3,
              ),
              // You can add more pages here as needed
            ],
          ),
          ///skip button
          const OnBoardingSkip(), // Positioned
         const OnBoardingDotNavigation(),

         OnBoardingNextButton() // Positioned




    ],
      ),
    );
  }
}






