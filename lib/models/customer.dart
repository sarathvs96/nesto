// customer_model.dart

class Customer {
  int id;
  int idd;
  String name;
  String profilePic;
  String mobileNumber;
  String email;
  String street;
  String streetTwo;
  String city;
  int pincode;
  String country;
  String state;
  String createdDate;
  String createdTime;
  String modifiedDate;
  String modifiedTime;
  int flag;

  Customer({
    required this.id,
    required this.idd,
    required this.name,
    required this.profilePic,
    required this.mobileNumber,
    required this.email,
    required this.street,
    required this.streetTwo,
    required this.city,
    required this.pincode,
    required this.country,
    required this.state,
    required this.createdDate,
    required this.createdTime,
    required this.modifiedDate,
    required this.modifiedTime,
    required this.flag,
  });

  factory Customer.fromJson(Map<String, dynamic> json) {
    return Customer(
      id: json['id'] ?? "",
      idd: json['id'] ?? "",
      name: json['name'] ?? "",
      profilePic: json['profile_pic'] ?? "",
      mobileNumber: json['mobile_number'] ?? "",
      email: json['email'] ?? "",
      street: json['street'] ?? "",
      streetTwo: json['street_two'] ?? "",
      city: json['city'] ?? "",
      pincode: json['pincode'] ?? "",
      country: json['country'] ?? "",
      state: json['state'] ?? "",
      createdDate: json['created_date'] ?? "",
      createdTime: json['created_time'] ?? "",
      modifiedDate: json['modified_date'] ?? "",
      modifiedTime: json['modified_time'] ?? "",
      flag: 1,
    );
  }
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['idd'] = idd;
    map['name'] = name;
    map['profilePic'] = profilePic;
    map['mobileNumber'] = mobileNumber;
    map['email'] = email;
    map['street'] = street;
    map['streetTwo'] = streetTwo;
    map['city'] = city;
    map['pincode'] = pincode;
    map['country'] = country;
    map['state'] = state;
    map['createdDate'] = createdDate;
    map['createdTime'] = createdTime;
    map['modifiedDate'] = modifiedDate;
    map['modifiedTime'] = modifiedTime;
    map['flag'] = flag;
    return map;
  }
}
