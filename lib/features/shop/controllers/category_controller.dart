

import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../../data/repositories/categories/category_repository.dart';
import '../../../utils/popups/loaders.dart';
import '../../authentication/models/category_model.dart';

class CategoryController extends GetxController {
  static CategoryController get instance => Get.find();

  final isLoading = false.obs;
  final _categoryRepository = Get.put(CategoryRepository());
  RxList<CategoryModel> allCategories = <CategoryModel>[].obs;
  RxList<CategoryModel> featuredCategories = <CategoryModel>[].obs;

  @override
  void onInit() {
    fetchCategories();
    super.onInit();
  }

  /// - - Load category data
  Future<void> fetchCategories() async {
    try {
//Show loader while loading categories
      isLoading.value = true;

//Fetch categories from data source (Firestore, API, etc)
      final categories = await _categoryRepository.getAllCategories();

//Update the categories list
      allCategories.assignAll(categories);

//Filter featured categories
      featuredCategories.assignAll(
          allCategories.where((category) =>
          category.isFeatured &&
              category.parentId.isEmpty).take(8).toList());
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
//Remove Loader
      isLoading.value = false;
    }
  }


}
