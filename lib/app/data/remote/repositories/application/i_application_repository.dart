import '../../base/idto.dart';
import '../../base/status.dart';
import '../../dto/application/application_out_dto.dart';

abstract class IApplicationRepository {
  Future<Status<bool>> create({required IDto dto});

  Future<Status<List<ApplicationOutDto>>> getAll({int? limit, int? offset});

  Future<Status<ApplicationOutDto>> get({required String applicationId});

  Future<Status<bool>> delete({required String applicationId});
}
