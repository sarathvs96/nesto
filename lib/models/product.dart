class Product {
  final int id;
  final int idd;
  final String name;
  final String image;
  final double price;
  final String createdDate;
  final String createdTime;
  final String modifiedDate;
  final String modifiedTime;
  final int flag;

  Product({
    required this.id,
    required this.idd,
    required this.name,
    required this.image,
    required this.price,
    required this.createdDate,
    required this.createdTime,
    required this.modifiedDate,
    required this.modifiedTime,
    required this.flag,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      idd: json['id'],
      name: json['name'],
      image: json['image'],
      price: double.parse(json['price'].toString()),
      createdDate: json['created_date'],
      createdTime: json['created_time'],
      modifiedDate: json['modified_date'],
      modifiedTime: json['modified_time'],
      flag: 1,
    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['idd'] = idd;
    map['name'] = name;
    map['image'] = image;
    map['price'] = price;
    map['created_date'] = createdDate;
    map['created_time'] = createdTime;
    map['modified_date'] = modifiedDate;
    map['modified_time'] = modifiedTime;
    map['flag'] = flag;
    return map;
  }
}
