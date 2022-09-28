abstract class IDto {
  Map<String, dynamic> toJson();

  IDto.fromJson(dynamic json);

}
