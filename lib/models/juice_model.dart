import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class JuiceModel {
  final String name;
  final String imageUrl;
  final double price;
  final String description;
  final String delivery_time;
  final String Serving;


  JuiceModel({
    required this.name,
    required this.imageUrl,
    required this.price,
    required this.description,
    required this.delivery_time,
    required this.Serving,

  });

   factory JuiceModel.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    if(kDebugMode){
      debugPrint(data.toString());
    }
    return JuiceModel(
      name: data['name'] ?? '',
      imageUrl: data['imageUrl'],
      price: (data['price'] ?? 0.0).toDouble(),
      description: data['description'] ?? '',
      delivery_time: data['delivery_time'],
      Serving: data['Serving'] ?? '',
    );
  }
}