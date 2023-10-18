part of services;

class HttpService extends GetxService {
  static HttpService get to => Get.find();

  late final Dio _dio;
  late final Dio _tokenDio;

  @override
  void onInit() {
    super.onInit();

    final options = BaseOptions(
      baseUrl: kServerUrl,
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      headers: {},
      contentType: Headers.jsonContentType,
      responseType: ResponseType.json,
    );

    _dio = Dio(options);
    _tokenDio = Dio(options);

    _dio.interceptors.add(_TokenQueuedInterceptor(_dio));
    _dio.interceptors.add(_RequestInterceptor());
  }

  Map<String, dynamic>? _getHeaders({bool excludeToken = false}) {
    final headers = <String, dynamic>{};
    // if (Get.isRegistered<UserStore>() &&
    //     UserStore.to.hasToken &&
    //     !excludeToken) {
    //   headers['Authorization'] = 'Bearer ${UserStore.to.token!.code}';
    // }
    return headers;
  }

  Future<ResponseModel> get(
    String url, {
    Map<String, dynamic>? params,
    Options? options,
    CancelToken? cancelToken,
    bool excludeToken = false,
    bool showLoading = false,
  }) async {
    if (showLoading) CustomToast.loading();
    try {
      final requestOptions = options ?? Options();
      requestOptions.headers = _getHeaders(excludeToken: excludeToken);
      final response = await _dio.get(
        url,
        queryParameters: params,
        options: requestOptions,
        cancelToken: cancelToken,
      );
      if (showLoading) CustomToast.dismiss();
      return ResponseModel.fromJson(response.data);
    } catch (error) {
      if (error is! DioException) CustomToast.dismiss();
      rethrow;
    }
  }

  Future<ResponseModel> post(
    String url, {
    Map<String, dynamic>? params,
    Options? options,
    CancelToken? cancelToken,
    bool excludeToken = false,
    bool showLoading = false,
  }) async {
    if (showLoading) CustomToast.loading();
    try {
      final requestOptions = options ?? Options();
      requestOptions.headers = _getHeaders(excludeToken: excludeToken);
      final response = await _dio.post(
        url,
        data: params,
        options: requestOptions,
        cancelToken: cancelToken,
      );
      if (showLoading) CustomToast.dismiss();
      return ResponseModel.fromJson(response.data);
    } catch (error) {
      if (error is! DioException) CustomToast.dismiss();
      rethrow;
    }
  }

  Future<ResponseModel> patch(
    String url, {
    Map<String, dynamic>? params,
    Options? options,
    CancelToken? cancelToken,
    bool excludeToken = false,
    bool showLoading = false,
  }) async {
    if (showLoading) CustomToast.loading();
    try {
      final requestOptions = options ?? Options();
      requestOptions.headers = _getHeaders(excludeToken: excludeToken);
      final response = await _dio.patch(
        url,
        data: params,
        options: requestOptions,
        cancelToken: cancelToken,
      );
      if (showLoading) CustomToast.dismiss();
      return ResponseModel.fromJson(response.data);
    } catch (error) {
      if (error is! DioException) CustomToast.dismiss();
      rethrow;
    }
  }

  Future<ResponseModel> delete(
    String url, {
    Map<String, dynamic>? params,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    bool excludeToken = false,
    bool showLoading = false,
  }) async {
    if (showLoading) CustomToast.loading();
    try {
      final requestOptions = options ?? Options();
      requestOptions.headers = _getHeaders(excludeToken: excludeToken);
      final response = await _dio.delete(
        url,
        data: params,
        queryParameters: queryParameters,
        options: requestOptions,
        cancelToken: cancelToken,
      );
      if (showLoading) CustomToast.dismiss();
      return ResponseModel.fromJson(response.data);
    } catch (error) {
      if (error is! DioException) CustomToast.dismiss();
      rethrow;
    }
  }

  Future<ResponseModel> refreshToken(
    String url, {
    Map<String, dynamic>? params,
    Options? options,
    CancelToken? cancelToken,
    bool excludeToken = false,
    bool showLoading = false,
  }) async {
    if (showLoading) CustomToast.loading();
    try {
      final requestOptions = options ?? Options();
      requestOptions.headers = _getHeaders(excludeToken: excludeToken);
      final response = await _tokenDio.put(
        url,
        data: params,
        options: requestOptions,
        cancelToken: cancelToken,
      );
      if (showLoading) CustomToast.dismiss();
      return ResponseModel.fromJson(response.data);
    } catch (error) {
      if (error is! DioException) CustomToast.dismiss();
      rethrow;
    }
  }

  Future<ResponseModel> put(
    String url, {
    Map<String, dynamic>? params,
    Options? options,
    CancelToken? cancelToken,
    bool excludeToken = false,
    bool showLoading = false,
  }) async {
    if (showLoading) CustomToast.loading();
    try {
      final requestOptions = options ?? Options();
      requestOptions.headers = _getHeaders(excludeToken: excludeToken);
      final response = await _dio.put(
        url,
        data: params,
        options: requestOptions,
        cancelToken: cancelToken,
      );
      if (showLoading) CustomToast.dismiss();
      return ResponseModel.fromJson(response.data);
    } catch (error) {
      if (error is! DioException) CustomToast.dismiss();
      rethrow;
    }
  }

  Future<ResponseModel> upload(
    String url, {
    required String path,
    Options? options,
    CancelToken? cancelToken,
    bool excludeToken = false,
  }) async {
    final requestOptions = options ?? Options();
    requestOptions.headers = _getHeaders(excludeToken: excludeToken);
    final name = path.substring(path.lastIndexOf('/') + 1, path.length);
    final image = await MultipartFile.fromFile(path, filename: name);
    final formData = FormData.fromMap({'file': image});
    final response = await _dio.post(
      url,
      data: formData,
      options: requestOptions,
      cancelToken: cancelToken,
    );
    return ResponseModel.fromJson(response.data);
  }

  Future<void> downloadStreamWithDio(
    String url, {
    bool showLoading = false,
  }) async {
    if (showLoading) CustomToast.loading();

    try {
      // 发起网络请求获取流
      final requestOptions = Options(responseType: ResponseType.stream);
      // requestOptions.headers = _getHeaders(excludeToken: false);
      final response =
          await _dio.post<ResponseBody>(url, options: requestOptions);

      // 获取应用的临时目录
      final Directory tempDir = await getTemporaryDirectory();
      // 创建保存文件的路径
      final String filePath = '${tempDir.path}/downloaded_file';

      // 将流写入文件
      final File file = File(filePath);
      final fileSink = file.openWrite();

      final responseBody = response.data; // 正确的方式来获取响应体

      await responseBody?.stream.forEach((chunk) {
        fileSink.add(chunk);
      });

      if (showLoading) CustomToast.dismiss();

      // await fileSink.close();
    } catch (error) {
      if (error is! DioException) CustomToast.dismiss();
      rethrow;
    }
  }
}

class _TokenQueuedInterceptor extends QueuedInterceptor {
  final Dio dio;

  _TokenQueuedInterceptor(this.dio);

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    final response = err.response;
    final statusCode = response?.statusCode;
    // final tokenStr = StorageService.to.getString(kLocalToken);
    // if (statusCode == 401 && tokenStr.isNotEmpty) {
    //   final token = TokenModel.fromString(tokenStr);
    //   if ((token.refreshCodeEXP ?? 0) > DateTime.now().millisecondsSinceEpoch) {
    //     final newToken = await AccountAPI.reLogin(
    //       token: token.code ?? '',
    //       refreshToken: token.refreshCode ?? '',
    //     );
    //     await UserStore.to.setToken(newToken);
    //     err.requestOptions.headers['Authorization'] = 'Bearer ${newToken.code}';
    //     final originResult = await dio.fetch(err.requestOptions);
    //     return handler.resolve(originResult);
    //   }
    // }
    super.onError(err, handler);
  }
}

class _RequestInterceptor extends Interceptor {
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (response.data['code'] != 0) {
      handler.reject(
        DioException(
          requestOptions: response.requestOptions,
          response: response,
          type: DioExceptionType.badResponse,
        ),
        true,
      );
    } else {
      super.onResponse(response, handler);
    }
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    Console.log(err.type);
    switch (err.type) {
      case DioExceptionType.connectionTimeout:
        CustomToast.fail('网络连接超时');
        break;
      case DioExceptionType.sendTimeout:
        CustomToast.fail('发送超时');
        break;
      case DioExceptionType.receiveTimeout:
        CustomToast.fail('接收超时');
        break;
      case DioExceptionType.badCertificate:
        CustomToast.fail('证书错误');
        break;
      case DioExceptionType.badResponse:
        final response = err.response;
        final statusCode = response?.statusCode;
        var msg = '服务器错误';
        switch (statusCode) {
          case 401:
            msg = '$statusCode - Unauthorized';
            // UserStore.to.removeToken();
            break;
          case 404:
            msg = '$statusCode - Server not found';
            break;
          case 500:
            msg = '$statusCode - Server error';
            break;
          case 502:
            msg = '$statusCode - Bad gateway';
            break;
          default:
            msg = response?.data?['message']?.toString() ?? msg;
            break;
        }
        CustomToast.fail(msg);
        break;
      case DioExceptionType.cancel:
        Console.log('请求取消');
        break;
      case DioExceptionType.connectionError:
        CustomToast.fail('网络连接失败');
        break;
      case DioExceptionType.unknown:
        CustomToast.fail('请求发生未知错误');
        break;
    }
    super.onError(err, handler);
  }
}
