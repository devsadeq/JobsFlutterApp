class CompanySearchOutDto {
  CompanySearchOutDto({
    this.id,
    this.name,
    this.image,
  });

  CompanySearchOutDto.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
  }

  String? id;
  String? name;
  String? image;

  CompanySearchOutDto copyWith({
    String? id,
    String? name,
    String? image,
  }) =>
      CompanySearchOutDto(
        id: id ?? this.id,
        name: name ?? this.name,
        image: image ?? this.image,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['image'] = image;
    return map;
  }
}
