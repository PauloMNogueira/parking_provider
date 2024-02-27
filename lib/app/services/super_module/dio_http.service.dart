import 'package:dio/dio.dart';
import 'package:super_module/entity/json_response.entity.dart';
import 'package:super_module/services/http.service.dart';

class DioHttpService extends HttpService {
  late final Dio _driver;
  final List<DioHttpService> _drivers = [];

  DioHttpService(
      {required super.baseUrl,
      super.connectTimeout,
      super.headers = const {}}) {
    _driver = Dio(BaseOptions(
      baseUrl: baseUrl,
      headers: headers,
      connectTimeout: connectTimeout,
    ));
  }

  @override
  HttpService copyWith(
      {String? baseUrl,
      Duration? connectTimeout,
      Map<String, dynamic>? headers}) {
    /// Create a new Header with the current headers used
    Map<String, dynamic> newHeaders = ({...this.headers});

    /// Append newly introduce headers to current headers
    newHeaders.addAll(headers ?? <String, dynamic>{});

    /// Create a Clone of the DioHttpService
    var clonedInstance = DioHttpService(
      baseUrl: baseUrl ?? this.baseUrl,
      connectTimeout: connectTimeout ?? this.connectTimeout,
      headers: newHeaders,
    );

    /// Add this clone to our clone index
    _drivers.add(clonedInstance);

    /// Return the clone to the caller
    return clonedInstance;
  }

  @override
  Future<JsonResponse> delete(String uri) async {
    var response = await _driver.delete(uri);
    return JsonResponse(
        statusCode: response.statusCode ?? -1, data: response.data);
  }

  @override
  Future<JsonResponse> get(String uri) async {
    var response = await _driver.get(uri);
    final Map<String, dynamic> result = {'data': response.data};
    return JsonResponse(statusCode: response.statusCode ?? -1, data: result);
  }

  @override
  Future<JsonResponse> patch(String uri, Map<String, dynamic> data) async {
    var response = await _driver.patch(uri, data: data);
    return JsonResponse(
        statusCode: response.statusCode ?? -1, data: response.data);
  }

  @override
  Future<JsonResponse> post(String uri, Map<String, dynamic> data) async {
    var response = await _driver.post(uri, data: data);
    return JsonResponse(
        statusCode: response.statusCode ?? -1, data: response.data);
  }

  @override
  Future<JsonResponse> put(String uri, Map<String, dynamic> data) async {
    var response = await _driver.put(uri, data: data);
    return JsonResponse(
        statusCode: response.statusCode ?? -1, data: response.data);
  }

  @override
  void updateHeaders(Map<String, dynamic> headers) {
    super.headers.addAll(headers);

    /// Update Dio Driver with the new Headers
    _driver.options.headers.addAll(headers);

    /// Update all Shadows from this instance
    for (var driver in _drivers) {
      driver.updateHeaders(headers);
    }
  }
}
