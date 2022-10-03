import 'package:jobs_flutter_app/app/data/remote/base/idto.dart';

class RegisterCompanyOutDto implements IDto {
  RegisterCompanyOutDto({
    this.token,
    this.company,
  });

  RegisterCompanyOutDto.fromJson(dynamic json) {
    token = json['token'] != null ? Token.fromJson(json['token']) : null;
    company =
        json['company'] != null ? Company.fromJson(json['company']) : null;
  }

  Token? token;
  Company? company;

  RegisterCompanyOutDto copyWith({
    Token? token,
    Company? company,
  }) =>
      RegisterCompanyOutDto(
        token: token ?? this.token,
        company: company ?? this.company,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (token != null) {
      map['token'] = token?.toJson();
    }
    if (company != null) {
      map['company'] = company?.toJson();
    }
    return map;
  }
}

class Company {
  Company({
    this.id,
    this.name,
    this.phone,
    this.email,
  });

  Company.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    phone = json['phone'];
    email = json['email'];
  }

  String? id;
  String? name;
  String? phone;
  String? email;

  Company copyWith({
    String? id,
    String? name,
    String? phone,
    String? email,
  }) =>
      Company(
        id: id ?? this.id,
        name: name ?? this.name,
        phone: phone ?? this.phone,
        email: email ?? this.email,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['phone'] = phone;
    map['email'] = email;
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
