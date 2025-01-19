
import 'package:get/get.dart';
import '../features/authentication/controllers/variation_controller.dart';
import '../features/authentication/screens/signup/widgets/network_manager.dart';

class GeneralBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(NetworkManager());
    Get.put(VariationController());

  }
}