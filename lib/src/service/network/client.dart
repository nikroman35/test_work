import 'package:dio/dio.dart';

class APIClientConst {

  static const baseURLAPI = "https://randomuser.me/api";
}

abstract class NetworkClient {

  static Dio getClient() {
    var dio =  Dio(
      BaseOptions(
        baseUrl: APIClientConst.baseURLAPI,
        receiveTimeout: 10000,
      )
    );
    return dio;
  }

}