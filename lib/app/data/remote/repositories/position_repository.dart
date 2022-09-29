import 'package:dio/dio.dart';
import '../base/i_choice_repository.dart';
import '../base/iservice.dart';
import '../base/state.dart';
import '../dto/choices/Position_out_dto.dart';
import '../exceptions/dio_exceptions.dart';

class PositionRepository extends IChoiceRepository<PositionOutDto> {
  final IService service;

  PositionRepository({required this.service});

  @override
  Future<State<List<PositionOutDto>>> getAll({int? limit, int? offset}) async {
    try {
      final response = await service.getAll(limit: limit, offset: offset);
      final positions = (response.data as List)
          .map((e) => PositionOutDto.fromJson(e))
          .toList();
      if (response.statusCode == 200) return State.success(data: positions);
      return const State.failure(reason: "Some thing wrong happen!");
    } on DioError catch (e) {
      final errMsg = DioExceptions.fromDioError(e).toString();
      return State.failure(reason: errMsg);
    }
  }
}
