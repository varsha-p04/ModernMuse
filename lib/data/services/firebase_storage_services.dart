import 'dart:async';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class TFirebaseStorageService extends GetxController {
  static TFirebaseStorageService get instance => Get.find();

  final firebaseStorage = FirebaseStorage.instance;

  /// Upload Local Assets from IDE
  /// Returns a Uint8List containing image data.
  Future<Uint8List> getImageDataFromAssets(String path) async {
    try {
      final byteData = await rootBundle.load(path);
      final imageData = byteData.buffer.asUint8List(byteData.lengthInBytes);
      return imageData;
    } catch (e) {
      // Handle exceptions gracefully
      throw 'Error loading image data: $e';
    }
  }

  /// Upload Image using ImageData on Cloud Firebase Storage
  /// Returns the download URL of the uploaded image.
  /// Upload Image using ImageData on Cloud Firebase Storage
  /// Returns the download URL of the uploaded image.
  Future<String> uploadImageData(String path, Uint8List image, String name) async {
    try {
      print('Uploading image: $name to path: $path');
      final ref = firebaseStorage.ref(path).child(name);
      await ref.putData(image);
      final url = await ref.getDownloadURL();
      print('Image uploaded successfully. URL: $url');
      return url;
    } catch (e) {
      print('Error uploading image: ${e.toString()}');
      if (e is FirebaseException) {
        throw 'Firebase Exception: ${e.message}, Code: ${e.code}';
      } else if (e is SocketException) {
        throw 'Network Error: ${e.message}';
      } else if (e is PlatformException) {
        throw 'Platform Exception: ${e.message}';
      } else {
        throw 'Something Went Wrong! ${e.toString()}';
      }
    }
  }


  /// Upload Image on Cloud Firebase Storage
  /// Returns the download URL of the uploaded image.
  Future<String> uploadImageFile(String path, XFile image) async {
    try {
      if (image.path.isEmpty) {
        throw 'Image file path is empty.';
      }
      print('Uploading image file: ${image.name} to path: $path');
      final ref = firebaseStorage.ref(path).child(image.name);
      await ref.putFile(File(image.path));
      final url = await ref.getDownloadURL();
      print('Image file uploaded successfully. URL: $url');
      return url;
    } catch (e) {
      print('Error uploading image file: ${e.toString()}');
      if (e is FirebaseException) {
        throw 'Firebase Exception: ${e.message}, Code: ${e.code}';
      } else if (e is SocketException) {
        throw 'Network Error: ${e.message}';
      } else if (e is PlatformException) {
        throw 'Platform Exception: ${e.message}';
      } else {
        throw 'Something Went Wrong! ${e.toString()}';
      }
    }
  }

}