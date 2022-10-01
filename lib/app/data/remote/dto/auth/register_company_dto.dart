import 'package:jobs_flutter_app/app/data/remote/base/idto.dart';

class RegisterCompanyDto implements IDto {
  RegisterCompanyDto({
    this.name,
    this.phone,
    this.email,
    this.address,
    this.country,
    this.password,
  });

  RegisterCompanyDto.fromJson(dynamic json) {
    name = json['name'];
    phone = json['phone'];
    email = json['email'];
    address = json['address'];
    country = json['country'];
    password = json['password'];
  }

  String? name;
  String? phone;
  String? email;
  String? address;
  String? country;
  String? password;

  RegisterCompanyDto copyWith({
    String? name,
    String? phone,
    String? email,
    String? address,
    String? country,
    String? password,
  }) =>
      RegisterCompanyDto(
        name: name ?? this.name,
        phone: phone ?? this.phone,
        email: email ?? this.email,
        address: address ?? this.address,
        country: country ?? this.country,
        password: password ?? this.password,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['phone'] = phone;
    map['email'] = email;
    map['address'] = address;
    map['country'] = country;
    map['password'] = password;
    return map;
  }
}
