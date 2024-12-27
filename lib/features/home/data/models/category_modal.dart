class CategoryModal {
  final String categoryName;
  final String categoryId;

  CategoryModal({
    required this.categoryName,
    required this.categoryId,
  });

  factory CategoryModal.fromJson(dynamic json) {
    return CategoryModal(
      categoryName: json['categoryName'],
      categoryId: json['categoryId'],
    );
  }

  Map<String, dynamic> tojson() {
    return {
      'categoryName': categoryName,
      'categoryId': categoryId,
    };
  }
}
