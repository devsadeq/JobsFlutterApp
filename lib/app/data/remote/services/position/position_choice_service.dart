import 'package:dio/src/response.dart';

import '../../api/api_routes.dart';
import '../../api/dio_client.dart';
import 'i_choice_service.dart';

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
