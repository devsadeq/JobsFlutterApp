import 'package:dio/dio.dart';
import 'package:get/utils.dart';

class DioInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    printInfo(info: "********************************** on Req");
    // options.headers['Authorization'] = AuthController.to.currentUser?.token;
    options.headers['Authorization'] =
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6InNhZGVxQGdtYWlsLmNvbSIsIm5hbWUiOiJTYWRlcSBTYWxhbSIsInBob25lIjoiMTIzNDU2Nzg5OTkifQ.WHPN95IItEFY2A8iDQjHHZd7up0cN9bCaRZvYJ5HRtk";
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    printInfo(info: "********************************** on Res");
    printInfo(info: "********************************** $response");
    super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    printInfo(info: "********************************** on Err");
    printInfo(info: "********************************** $err");
    super.onError(err, handler);
  }
}
