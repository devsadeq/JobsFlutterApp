import 'package:jobs_flutter_app/app/data/remote/base/idto.dart';
import 'package:jobs_flutter_app/app/data/remote/base/status.dart';

abstract class ICustomerRepository {
  Future<Status<bool>> saveJob({
    required String customerUuid,
    required String jobUuid,
  });

  Future<Status<bool>> unSaveJob({
    required String customerUuid,
    required String jobUuid,
  });

  Future<Status<List<IDto>>> getAllSavedJobs({
    int? limit,
    int? offset,
    required String customerUuid,
  });
}
