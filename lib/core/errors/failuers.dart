import 'package:dio/dio.dart';

abstract class Failure {
  final String errMessage;

  Failure(this.errMessage);
}

class ServerFailure extends Failure {
  ServerFailure(super.errMessage);

  factory ServerFailure.fromDioError(DioError dioError) {
    switch (dioError.type) {
      case DioErrorType.connectionTimeout:
        return ServerFailure('Connection timeout with api server');

      case DioErrorType.sendTimeout:
        return ServerFailure('Send timeout with api server');

      case DioErrorType.receiveTimeout:
        return ServerFailure('Receive timeout with api server');

      case DioErrorType.badCertificate:
        return ServerFailure('Bad certificate');

      case DioErrorType.badResponse:
        return ServerFailure.fromResponse(
            dioError.response!.statusCode!, dioError.response!.data);

      case DioErrorType.cancel:
        return ServerFailure('Request to api server was canceld');

      case DioErrorType.connectionError:
        return ServerFailure('opps there is Connection Error');
        
      case DioErrorType.unknown:
        if (dioError.message!.contains('SocketException')) {
          return ServerFailure('No Internet conection');
        }
        return ServerFailure('Unexpected error, pls try again later');
      default:
        return ServerFailure('Opps there was an error, pls try again');
    }
  }

  factory ServerFailure.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(response['error']['message']);
    } else if (statusCode == 404) {
      return ServerFailure('Your request not found, please try again later!');
    } else if (statusCode == 500) {
      return ServerFailure('Internal server error pls try again later');
    } else {
      return ServerFailure('Opps there was an error, pls try again');
    }
  }
}
