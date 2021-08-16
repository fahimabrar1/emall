class ShopModel {
  String shop_id;
  String shop_name;
  String category_id_fk;
  String logo;

  ShopModel({
    required this.shop_id,
    required this.shop_name,
    required this.category_id_fk,
    required this.logo,
  });

  factory ShopModel.fromJson(Map<String, dynamic> json) {
    return ShopModel(
      shop_id: json['shop_id'],
      shop_name: json['shop_name'],
      category_id_fk: json['category_id_fk'],
      logo: json['logo'],
    );
  }
}
