class ProductModel {
  final String id;
  final String name;
  final String image;
  final String description;
  final double price;

  ProductModel({
    required this.id,
    required this.name,
    required this.image,
    required this.description,
    required this.price,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json['id'],
        name: json['name'],
        image: json['image'],
        description: json['description'],
        price: json['price'].toDouble(),
      );
}
