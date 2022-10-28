import 'package:dio/dio.dart';

import '../../base/status.dart';
import '../../dto/company/Company_out_dto.dart';
import '../../exceptions/dio_exceptions.dart';
import '../../services/company/i_company_service.dart';
import 'i_company_repository.dart';

class CompanyRepository implements ICompanyRepository<CompanyOutDto> {
  final ICompanyService service;

  CompanyRepository({required this.service});

  @override
  Future<Status<CompanyOutDto>> get({required String uuid}) async {
    try {
      final response = await service.get(uuid: uuid);
      if (response.statusCode == 200) {
        final CompanyOutDto job = CompanyOutDto.fromJson(response.data);
        return Status.success(data: job);
      }
      return const Status.failure(reason: "Something went wrong!");
    } on DioError catch (e) {
      final errMsg = DioExceptions.fromDioError(e).toString();
      return Status.failure(reason: errMsg);
    }
  }
}
