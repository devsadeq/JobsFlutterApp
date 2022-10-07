import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

import '../../../modules/auth/controllers/auth_controller.dart';

class DioInterceptor extends Interceptor {
  final logger = Logger(printer: PrettyPrinter());
  final loggerNoStack = Logger(printer: PrettyPrinter(methodCount: 0));

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers['Authorization'] =
        "Bearer ${AuthController.to.currentUser?.token}";

    logger.d("On new Request");
    logger.i("Headers: \n${options.headers.toString()}");
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    logger.d("On new Response.");
    loggerNoStack.i("Status Code: ${response.statusCode}");
    loggerNoStack.i("Status Msg: ${response.statusMessage}");
    loggerNoStack.i("Headers: \n${response.headers.toString()}");
    loggerNoStack.v(response.data.toString());
    super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    logger.d("On Error.");
    loggerNoStack.e("Error Msg: ${err.message}");
    loggerNoStack.e("Error Type: ${err.type}");
    loggerNoStack.e("Error Response: ${err.response.toString()}");
    super.onError(err, handler);
  }
}
