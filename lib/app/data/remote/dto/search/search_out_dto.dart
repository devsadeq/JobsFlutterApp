class SearchOutDto {
  SearchOutDto({
    this.id,
    this.name,
    this.image,
  });

  SearchOutDto.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
  }

  String? id;
  String? name;
  String? image;

  SearchOutDto copyWith({
    String? id,
    String? name,
    String? image,
  }) =>
      SearchOutDto(
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
