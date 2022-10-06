import 'package:dio/src/response.dart';
import 'package:jobs_flutter_app/app/data/remote/base/ichoice_service.dart';

import '../../../utils/constants.dart';
import '../api/dio_client.dart';

class PositionChoiceService extends IChoiceService {
  final DioClient dioClient;

  PositionChoiceService({required this.dioClient});

  @override
  Future<Response> getAll({int? limit, int? offset, String? q}) async {
    try {
      return await dioClient.get(ApiRoutes.POSITIONS);
    } catch (e) {
      rethrow;
    }
  }
}
