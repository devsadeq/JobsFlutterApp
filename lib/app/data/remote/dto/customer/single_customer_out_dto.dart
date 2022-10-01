import 'package:jobs_flutter_app/app/data/remote/base/idto.dart';

class SingleCustomerOutDto implements IDto {
  SingleCustomerOutDto({
    this.id,
    this.name,
    this.email,
    this.phone,
  });

  SingleCustomerOutDto.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
  }

  String? id;
  String? name;
  String? email;
  String? phone;

  SingleCustomerOutDto copyWith({
    String? id,
    String? name,
    String? email,
    String? phone,
  }) =>
      SingleCustomerOutDto(
        id: id ?? this.id,
        name: name ?? this.name,
        email: email ?? this.email,
        phone: phone ?? this.phone,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['email'] = email;
    map['phone'] = phone;
    return map;
  }
}
