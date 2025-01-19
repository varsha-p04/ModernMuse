import 'package:cloud_firestore/cloud_firestore.dart';

class BannerModel {
  final String imageUrl;
  final String targetScreen;
  final bool active;

  BannerModel({
    required this.imageUrl,
    required this.targetScreen,
    required this.active,
  });

  Map<String, dynamic> toJson() {
    return {
      'imageurl': imageUrl,      // Consistent key name
      'targetscreen': targetScreen, // Consistent key name
      'active': active,           // Consistent key name
    };
  }

  factory BannerModel.fromSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;

    return BannerModel(
      imageUrl: data['imageurl'] ?? '',  // Consistent key name
      targetScreen: data['targetscreen'] ?? '', // Consistent key name
      active: data['active'] ?? false,   // Consistent key name
    );
  }
}
