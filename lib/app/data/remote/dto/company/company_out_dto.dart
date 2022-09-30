class CompanyOutDto {
  CompanyOutDto({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.description,
    this.workType,
    this.city,
    this.address,
    this.image,
  });

  CompanyOutDto.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    description = json['description'];
    workType = json['work_type'];
    city = json['city'];
    address = json['address'];
    image = json['image'];
  }

  String? id;
  String? name;
  String? email;
  String? phone;
  String? description;
  String? workType;
  String? city;
  String? address;
  String? image;

  CompanyOutDto copyWith({
    String? id,
    String? name,
    String? email,
    String? phone,
    String? description,
    String? workType,
    String? city,
    String? address,
    String? image,
  }) =>
      CompanyOutDto(
        id: id ?? this.id,
        name: name ?? this.name,
        email: email ?? this.email,
        phone: phone ?? this.phone,
        description: description ?? this.description,
        workType: workType ?? this.workType,
        city: city ?? this.city,
        address: address ?? this.address,
        image: image ?? this.image,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['email'] = email;
    map['phone'] = phone;
    map['description'] = description;
    map['work_type'] = workType;
    map['city'] = city;
    map['address'] = address;
    map['image'] = image;
    return map;
  }
}
