import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:get_storage/get_storage.dart';

import '../data/local/services/storage_service.dart';
import '../data/remote/api/dio_client.dart';
import '../data/remote/repositories/application/application_repository.dart';
import '../data/remote/repositories/auth/auth_repository.dart';
import '../data/remote/repositories/company/company_repository.dart';
import '../data/remote/repositories/customer/customer_repository.dart';
import '../data/remote/repositories/job/job_repository.dart';
import '../data/remote/repositories/position/position_repository.dart';
import '../data/remote/repositories/search/search_repository.dart';
import '../data/remote/services/application/application_service.dart';
import '../data/remote/services/auth/auth_service.dart';
import '../data/remote/services/company/comapny_service.dart';
import '../data/remote/services/customer/customer_service.dart';
import '../data/remote/services/job/job_service.dart';
import '../data/remote/services/position/position_choice_service.dart';
import '../data/remote/services/search/search_service.dart';

final getIt = GetIt.instance;

Future<void> setupLocator() async {
  /// Dio Client
  getIt.registerSingleton(Dio());
  getIt.registerSingleton(DioClient(getIt<Dio>()));

  /// Storage Service
  getIt.registerSingleton(GetStorage());
  getIt.registerSingleton(StorageService(getIt<GetStorage>()));

  /// Job Service & Repository
  getIt.registerSingleton(JobService(dioClient: getIt<DioClient>()));
  getIt.registerSingleton(JobRepository(service: getIt<JobService>()));

  /// Position Service & Repository
  getIt.registerSingleton(PositionChoiceService(dioClient: getIt<DioClient>()));
  getIt.registerSingleton(
      PositionRepository(service: getIt<PositionChoiceService>()));

  /// Search Service & Repository
  getIt.registerSingleton(SearchService(dioClient: getIt<DioClient>()));
  getIt.registerSingleton(SearchRepository(service: getIt<SearchService>()));

  /// Company Service & Repository
  getIt.registerSingleton(CompanyService(dioClient: getIt<DioClient>()));
  getIt.registerSingleton(CompanyRepository(service: getIt<CompanyService>()));

  /// Customer Service & Repository
  getIt.registerSingleton(CustomerService(dioClient: getIt<DioClient>()));
  getIt.registerSingleton(CustomerRepository(service: getIt<CustomerService>()));

  /// Auth Service & Repository
  getIt.registerSingleton(AuthService(dioClient: getIt<DioClient>()));
  getIt.registerSingleton(AuthRepository(
    authService: getIt<AuthService>(),
    storageService: getIt<StorageService>(),
  ));

  /// Job Application Service & Repository
  getIt.registerSingleton(ApplicationService(dioClient: getIt<DioClient>()));
  getIt.registerSingleton(
      ApplicationRepository(service: getIt<ApplicationService>()));
}
