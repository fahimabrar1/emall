class ProductModel {
  final String product_id;
  final String name;
  final String description;
  final int price;
  final String product_category;
  final String image1;
  final String image2;
  final String image3;
  final int discount;
  final String shop_id_fk;
  final String date_added;

  ProductModel({
    required this.product_id,
    required this.name,
    required this.description,
    required this.price,
    required this.product_category,
    required this.image1,
    required this.image2,
    required this.image3,
    required this.discount,
    required this.shop_id_fk,
    required this.date_added,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      product_id: json['product_id'],
      name: json['name'],
      description: json['description'],
      price: json['price'],
      product_category: json['product_category'],
      image1: json['image1'],
      image2: json['image2'],
      image3: json['image3'],
      discount: json['discount'],
      shop_id_fk: json['shop_id_fk'],
      date_added: json['date_added'],
    );
  }
}
