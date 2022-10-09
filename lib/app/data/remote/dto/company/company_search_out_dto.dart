class CompanySearchOutDto {
  CompanySearchOutDto({
    this.id,
    this.name,
    this.image,
    this.workType,
  });

  CompanySearchOutDto.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    workType = json['work_type'];
  }

  String? id;
  String? name;
  String? image;
  String? workType;

  CompanySearchOutDto copyWith({
    String? id,
    String? name,
    String? image,
    String? workType,
  }) =>
      CompanySearchOutDto(
        id: id ?? this.id,
        name: name ?? this.name,
        image: image ?? this.image,
        workType: workType ?? this.workType,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['image'] = image;
    map['work_type'] = workType;
    return map;
  }
}
