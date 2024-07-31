import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../env/env.dart';
import 'api_constant.dart';
import 'api_log_interceptor.dart';
import 'api_network_exception.dart';
import 'api_pinning_adapter.dart';

part 'api_manger.g.dart';

abstract class IApiManager {
  Future<dynamic> get(String path, {Map<String, dynamic>? queryParameters});
  Future<dynamic> post(String path, {dynamic data});
  Future<dynamic> put(String path, {dynamic data});
  Future<dynamic> delete(String path);
}

class ApiManagerDi implements IApiManager {
  final Dio _dio;

  ApiManagerDi(this._dio);

  Future<dynamic> _executeRequest(Future<Response<dynamic>> Function() request) async {
    try {
      final response = await request();
      return response.data;
    } on DioException catch (e) {
      throw DioExceptions.fromDioError(e);
    } catch (e) {
      throw Exception("An unexpected error occurred: $e");
    }
  }

  @override
  Future<dynamic> get(String path, {Map<String, dynamic>? queryParameters}) async {
    return _executeRequest(() => _dio.get(path, queryParameters: queryParameters));
  }

  @override
  Future<dynamic> post(String path, {dynamic data}) async {
    return _executeRequest(() => _dio.post(path, data: data));
  }

  @override
  Future<dynamic> put(String path, {dynamic data}) async {
    return _executeRequest(() => _dio.put(path, data: data));
  }

  @override
  Future<dynamic> delete(String path) async {
    return _executeRequest(() => _dio.delete(path));
  }
}

@Riverpod(keepAlive: true)
Dio dio(DioRef ref) {
  final dio = Dio(BaseOptions(
    baseUrl: ApiConstant.baseUrl,
    connectTimeout: const Duration(seconds: RequestConstants.connectionTimeout),
    receiveTimeout: const Duration(seconds: RequestConstants.receiveTimeout),
    responseType: ResponseType.json,
    contentType: Headers.jsonContentType,
    headers: RequestConstants.headers,
    followRedirects: true,
    maxRedirects: 5,
  ));

  dio.interceptors.add(EnhancedLogInterceptor());

  // SSL Pinning setup
  // final allowedSHAFingerprints = [
  //   '52bdc3ed42f3a233e36312d85670625003df560817dfd3fcde071471ca309149',
  //   '4eba6e4ed0d49793356acaec8a2c237b3c00dc7a62822e9b26b724209e37e1c9',
  // ];

  
  final allowedSHAFingerprints = Env.allowedShaFingerPrint;
  dio.httpClientAdapter = PinningHttpClientAdapter(allowedSHAFingerprints);

  return dio;
}

@Riverpod(keepAlive: true)
IApiManager apiManager(ApiManagerRef ref) {
  return ApiManagerDi(ref.watch(dioProvider));
}
