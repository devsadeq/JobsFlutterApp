import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:jobs_flutter_app/app/data/remote/api/dio_client.dart';
import 'package:jobs_flutter_app/app/data/remote/repositories/job_repository.dart';
import 'package:jobs_flutter_app/app/data/remote/services/job_service.dart';

final getIt = GetIt.instance;

Future<void> setupLocator() async {
  getIt.registerSingleton(Dio());
  getIt.registerSingleton(DioClient(getIt<Dio>()));
  getIt.registerSingleton(JobService(dioClient: getIt<DioClient>()));
  getIt.registerSingleton(JobRepository(service: getIt<JobService>()));
}
