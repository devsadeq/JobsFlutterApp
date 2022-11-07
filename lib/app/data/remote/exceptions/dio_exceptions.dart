import 'package:dio/dio.dart';

class DioExceptions implements Exception {
  late String message;

  static const Map<String, String> _errorCodes = {
    '400': 'Bad Request',
    '401': 'Unauthorized',
    '403': 'Forbidden',
    '404': 'Not Found',
    '408': 'Request Timeout',
    '500': 'Internal Server Error',
    '502': 'Bad Gateway',
    '503': 'Service Unavailable',
    '504': 'Gateway Timeout',
    '505': 'HTTP Version Not Supported',
    '511': 'Network Authentication Required',
    '520': 'Unknown Error',
    '521': 'Web Server Is Down',
    '522': 'Connection Timed Out',
    '523': 'Origin Is Unreachable',
    '524': 'A Timeout Occurred',
    '525': 'SSL Handshake Failed',
    '526': 'Invalid SSL Certificate',
    '530': 'Origin DNS Error',
    '598': 'Network Read Timeout Error',
    '599': 'Network Connect Timeout Error',
  };

  static const Map<String, String> _errorTypes = {
    'cancel': 'Request to API server was cancelled',
    'connectTimeout': 'Connection timeout with API server',
    'default': 'Connection to API server failed due to internet connection',
    'receiveTimeout': 'Receive timeout in connection with API server',
    'sendTimeout': 'Send timeout in connection with API server',
    'other': 'Connection to API server failed due to internet connection',
  };

  DioExceptions.fromDioError(DioError dioError) {
    message = _getErrorMessage(dioError);
  }

  String _getErrorMessage(DioError error) {
    String errorType = error.type.toString().split('.').last;
    String errorMessage = _errorTypes[errorType] ??
        error.response?.data['error'] ??
        _errorCodes[error.response?.statusCode.toString()] ??
        'Something went wrong';
    return errorMessage;
  }

  @override
  String toString() => message;
}
