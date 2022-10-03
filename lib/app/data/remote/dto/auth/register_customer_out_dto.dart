import 'package:jobs_flutter_app/app/data/remote/base/idto.dart';

class RegisterCustomerOutDto implements IDto {
  RegisterCustomerOutDto({
    this.token,
    this.customer,
  });

  RegisterCustomerOutDto.fromJson(dynamic json) {
    token = json['token'] != null ? Token.fromJson(json['token']) : null;
    customer =
        json['customer'] != null ? Customer.fromJson(json['customer']) : null;
  }

  Token? token;
  Customer? customer;

  RegisterCustomerOutDto copyWith({
    Token? token,
    Customer? customer,
  }) =>
      RegisterCustomerOutDto(
        token: token ?? this.token,
        customer: customer ?? this.customer,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (token != null) {
      map['token'] = token?.toJson();
    }
    if (customer != null) {
      map['customer'] = customer?.toJson();
    }
    return map;
  }
}

class Customer {
  Customer({
    this.id,
    this.name,
    this.email,
    this.phone,
  });

  Customer.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
  }

  String? id;
  String? name;
  String? email;
  String? phone;

  Customer copyWith({
    String? id,
    String? name,
    String? email,
    String? phone,
  }) =>
      Customer(
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

class Token {
  Token({
    this.access,
  });

  Token.fromJson(dynamic json) {
    access = json['access'];
  }

  String? access;

  Token copyWith({
    String? access,
  }) =>
      Token(
        access: access ?? this.access,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['access'] = access;
    return map;
  }
}
