
class UserModel
{
  String ?name;
  String ?email;
  String ?phone;
  String ?address;
  String ?image;
  String ?id;
  String ?countryCode;

  UserModel({this.name, this.email, this.phone,  this.image, this.id ,
  this.countryCode
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      image: json['image'],
      id: json['id'],
      countryCode: json["country_code"],
    );
  }
  UserModel copyWith({
    String ?name,
    String ?email,
    String ?phone,
    String ?address,
    String ?image,
    String ?id,
    String ?countryCode,
  }) {
    return UserModel(
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      image: image ?? this.image,
      id: id ?? this.id,
      countryCode: countryCode ?? this.countryCode,
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'phone': phone,
      'image': image,
      'id': id,
      "country_code" : countryCode,
    };
  }
}