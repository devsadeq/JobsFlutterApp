import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:jobs_flutter_app/app/data/remote/api/dio_client.dart';
import 'package:jobs_flutter_app/app/data/remote/repositories/auth_repository.dart';
import 'package:jobs_flutter_app/app/data/remote/repositories/company_repository.dart';
import 'package:jobs_flutter_app/app/data/remote/repositories/job_repository.dart';
import 'package:jobs_flutter_app/app/data/remote/repositories/search_repository.dart';
import 'package:jobs_flutter_app/app/data/remote/services/auth_service.dart';
import 'package:jobs_flutter_app/app/data/remote/services/comapny_service.dart';
import 'package:jobs_flutter_app/app/data/remote/services/job_service.dart';
import 'package:jobs_flutter_app/app/data/remote/services/position_choice_service.dart';
import 'package:jobs_flutter_app/app/data/remote/services/search_service.dart';

import '../data/remote/repositories/position_repository.dart';

final getIt = GetIt.instance;

Future<void> setupLocator() async {
  // Dio
  getIt.registerSingleton(Dio());
  getIt.registerSingleton(DioClient(getIt<Dio>()));
  // Job
  getIt.registerSingleton(JobService(dioClient: getIt<DioClient>()));
  getIt.registerSingleton(JobRepository(service: getIt<JobService>()));
  // Position Choices
  getIt.registerSingleton(PositionChoiceService(dioClient: getIt<DioClient>()));
  getIt.registerSingleton(
      PositionRepository(service: getIt<PositionChoiceService>()));
  // Search
  getIt.registerSingleton(SearchService(dioClient: getIt<DioClient>()));
  getIt.registerSingleton(SearchRepository(service: getIt<SearchService>()));
  // Company
  getIt.registerSingleton(CompanyService(dioClient: getIt<DioClient>()));
  getIt.registerSingleton(CompanyRepository(service: getIt<CompanyService>()));
  // Auth
  getIt.registerSingleton(AuthService(dioClient: getIt<DioClient>()));
  getIt.registerSingleton(AuthRepository(service: getIt<AuthService>()));
}
