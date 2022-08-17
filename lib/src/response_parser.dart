import 'package:fpdart/fpdart.dart';

part 'response_parser_helpers.dart';

/// {@template response_parser}
/// Response Parser makes it easier to parse data and error response from server.
///
/// You can write this:
/// ```dart
/// Future<Either<User, ApiFailure>> fetchUser() async {
///   return parseApiResponse(
///     requestAction: () => dio.get('/user'),
///     mapper: User.fromJson,
///   );
/// }
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
/// To do so you need to do a little preparation. For example lets assume your server returns such response:
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
/// And create top level [parseApiResponse], [parseListApiResponse] and [parseEmptyApiResponse] functions.
/// ```dart
/// final parseApiResponse = _exampleResponseParser.parseApiResponse;
/// final parseListApiResponse = _exampleResponseParser.parseListApiResponse;
/// final parseEmptyApiResponse = _exampleResponseParser.parseEmptyApiResponse;
/// ```
/// That's all!\
/// For more info you can take a look at example.
/// {@endtemplate}
class ResponseParser<Response, Failure> {
  /// {@macro response_parser}
  const ResponseParser({
    required this.dataExtractor,
    required this.failureParser,
    required this.errorCatcher,
  });

  final DataExtractor<Response> dataExtractor;
  final FailureParser<Failure, Response> failureParser;
  final ErrorCatcher<Failure> errorCatcher;

  /// This method parses [Failure] or [Data] from [Response].
  ///
  /// {@template parse_response_parameters_description}
  /// It gains [requestAction] which will be immediately executed and [mapper] to parse [Data] from json.
  /// {@endtemplate}
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

  /// This method parses [Failure] or List of [Data] from [Response].
  ///
  /// {@macro parse_response_parameters_description}
  Future<Either<Failure, List<Data>>> parseListApiResponse<Data>({
    required RequestAction<Response> requestAction,
    required JsonMapper<Data> mapper,
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

  /// This method parses [Failure] from response if any.
  ///
  /// It gains [requestAction] which will be immediately executed.
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

/// Typedef for function which returns data (List or Map) from [Response].
typedef DataExtractor<Response> = Object Function(Response response);

/// Typedef for function which parses [Failure] from [Response].
typedef FailureParser<Failure, Response> = Failure? Function(
  Response response,
);

/// Typedef for function which handles catched [error] and [stackTrace].
typedef ErrorCatcher<Failure> = Failure Function(
  Object error,
  StackTrace stackTrace,
);

/// Typedef for [json] to [Data] parser.
typedef JsonMapper<Data> = Data Function(Map<String, dynamic> json);

/// Typedef for api request which returns [Response].
typedef RequestAction<Response> = Future<Response> Function();
