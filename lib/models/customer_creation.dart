class CustomerCreation {
  String name;
  String profilePic;
  String mobileNumber;
  String email;
  String street;
  String streetTwo;
  String city;
  String pincode;
  String country;
  String state;

  CustomerCreation({
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
  });

  CustomerCreation copyWith({
    String? name,
    String? profilePic,
    String? mobileNumber,
    String? email,
    String? street,
    String? streetTwo,
    String? city,
    String? pincode,
    String? country,
    String? state,
  }) {
    return CustomerCreation(
      name: name ?? this.name,
      profilePic: profilePic ?? this.profilePic,
      mobileNumber: mobileNumber ?? this.mobileNumber,
      email: email ?? this.email,
      street: street ?? this.street,
      streetTwo: streetTwo ?? this.streetTwo,
      city: city ?? this.city,
      pincode: pincode ?? this.pincode,
      country: country ?? this.country,
      state: state ?? this.state,
    );
  }
}
