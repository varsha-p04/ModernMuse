import "package:cloud_firestore/cloud_firestore.dart";
import "package:flutter/services.dart";
import "package:get/get.dart";

import "../../../features/authentication/models/category_model.dart";
import "../../../utils/exceptions/firebase_exceptions.dart";
import "../../../utils/exceptions/platform_exceptions.dart";
import "../../services/firebase_storage_services.dart";



class CategoryRepository extends GetxController {
  static CategoryRepository get instance => Get.find();

  /// Variables
  final _db = FirebaseFirestore.instance;

  ///Get all categories
  Future<List<CategoryModel>> getAllCategories() async {
    try {
      final snapshot = await _db.collection('Categories').get();
      final list = snapshot.docs.map((document) =>
          CategoryModel.fromSnapshot(document)).toList();
      return list;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  Future<void> uploadDummyData(List<CategoryModel> categories) async {
    try {
      // Initialize Firebase Storage service
      final storage = Get.put(TFirebaseStorageService());

      // Loop through each category
      for (var category in categories) {
        // Get ImageData link from the local assets
        final file = await storage.getImageDataFromAssets(category.image);

        // Upload Image and Get its URL
        final url = await storage.uploadImageData("Categories", file, category.name);

        // Assign URL to Category, image attribute
        category.image = url; // Corrected from `inage` to `image`

        // Store Category in Firestore
        await FirebaseFirestore.instance.collection("Categories").doc(category.id).set(category.toJson());
      }
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }


}
