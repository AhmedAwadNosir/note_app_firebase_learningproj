import 'package:flutter/material.dart';

class CategoryModal {
  final String categoryName;
  final String userId;
  String? docId;
  CategoryModal({
    required this.categoryName,
    required this.userId,
    @required this.docId,
  });

  factory CategoryModal.fromJson(dynamic json) {
    return CategoryModal(
      categoryName: json['categoryName'],
      userId: json['userId'],
    );
  }

  Map<String, dynamic> tojson() {
    return {
      'categoryName': categoryName,
      'userId': userId,
    };
  }
}
