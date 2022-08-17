import 'package:fpdart/fpdart.dart';

part 'response_parser_helpers.dart';

/// Response Parser makes it easier to parse data and error response from server.
///
/// You can write this:
/// ```dart
/// 
/// ```
/// Instead of writing this boring code all the time
/// ```dart
/// Future<Either<User, ApiFailure>> fetchUser() async {
///   final dio = Dio(BaseOptions(baseUrl: 'https://example.com'));
///   try {
///     final request = await dio.get('/user');
///     final data = request.data?['data'];
///     if (data == null) {
///       final error = request.data?['error'];
///       if (error != null) {
///         return ApiFailure.serverFailure(error['message']);
///       } else {
///         return ApiFailure.unknown();
///       }
///     } else {
///       return User.fromJson(data);
///     }
///   } catch (error, st) {
///     ApiFailure? apiFailure;
///     if (error is DioError) {
///       final responseFailure = error.response?.data;
///       if (responseFailure is Map<String, dynamic>) {
///         apiFailure = ApiFailure.serverFailure(responseFailure['message']);
///       } else {
///         apiFailure = ApiFailure.httpError(error.response?.statusCode);
///       }
///     }
///     return apiFailure ?? ApiFailure.unknown();
///   }
/// }
/// ```
///
/// For example your server returns such response:
/// ```json
/// {
///   "data": {
///     // Data you requested
///   },
///   "error": {
///     // Server error which you should parse and show to user
///     "message": "Something went wrong"
///   }
/// }
/// ```
/// And your error model looks this way:
/// ```dart
/// class ApiFailure {
///   factory ApiFailure.unknown() = _UnknownApiFailure;
///   factory ApiFailure.serverFailure(String errorMessage) = _ServerFailure;
///   factory ApiFailure.httpError(int? statusCode) = _HttpError;
/// }
/// ```
/// Then you need to implement [dataExtractor], [failureParser] and [errorCatcher] this way:
/// ```dart
/// final _exampleResponseParser = ResponseParser<Response, ApiFailure>(
///   dataExtractor: (response) => response.data['data']!,
///   failureParser: (response) {
///     final error = json['error'];
///     if (error is Map<String, dynamic>) {
///       return ApiFailure.serverFailure(error['message']);
///     } else {
///       return null;
///     }
///   },
///   errorCatcher: (error, stackTrace) {
///     ApiFailure? apiFailure;
///     if (error is DioError) {
///       apiFailure = ApiFailure.httpError(error.response?.statusCode);
///     }
///
///     return apiFailure ?? ApiFailure.unknown();
///   },
/// );
/// ```
class ResponseParser<Response, Failure> {
  const ResponseParser({
    required this.dataExtractor,
    required this.failureParser,
    required this.errorCatcher,
  });

  final DataExtractor<Response> dataExtractor;
  final FailureParser<Failure, Response> failureParser;
  final ErrorCatcher<Failure> errorCatcher;

  Future<Either<Failure, Data>> parseApiResponse<Data>({
    required RequestAction<Response> requestAction,
    required JsonMapper<Data> mapper,
  }) async {
    final responseEither = await _tryMakeRequest(
      requestAction: requestAction,
      errorCatcher: errorCatcher,
    );

    return responseEither.fold(left, (response) {
      return _parseResponse(
        response,
        dataParser: (data) => _dataParser(data, mapper),
        dataExtractor: dataExtractor,
        failureParser: failureParser,
        errorCatcher: errorCatcher,
      );
    });
  }

  Future<Either<Failure, List<T>>> parseListApiResponse<T>({
    required RequestAction<Response> requestAction,
    required JsonMapper<T> mapper,
  }) async {
    final responseEither = await _tryMakeRequest(
      requestAction: requestAction,
      errorCatcher: errorCatcher,
    );

    return responseEither.fold(Left.new, (response) {
      return _parseResponse(
        response,
        dataParser: (data) => _listDataParser(data, mapper),
        dataExtractor: dataExtractor,
        failureParser: failureParser,
        errorCatcher: errorCatcher,
      );
    });
  }

  Future<Option<Failure>> parseEmptyApiResponse({
    required RequestAction<Response> requestAction,
  }) async {
    final responseEither = await _tryMakeRequest(
      requestAction: requestAction,
      errorCatcher: errorCatcher,
    );

    return responseEither.fold(Some.new, (response) {
      try {
        final responseFailure = failureParser(response);
        return optionOf(responseFailure);
      } catch (e, st) {
        return some(errorCatcher(e, st));
      }
    });
  }
}

typedef DataExtractor<Response> = Object Function(Response response);
typedef FailureParser<Failure, Response> = Failure? Function(
  Response response,
);
typedef ErrorCatcher<Failure> = Failure Function(
  Object error,
  StackTrace stackTrace,
);

typedef JsonMapper<T> = T Function(Map<String, dynamic> json);

typedef RequestAction<Response> = Future<Response> Function();
