import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:response_parser/response_parser.dart';

part 'example.freezed.dart';
part 'example.g.dart';

final _exampleResponseParser = ResponseParser<Response, ApiFailure>(
  dataExtractor: (response) => response.data['data']!,
  failureParser: (response) => _parseApiFailure(response.data),
  errorCatcher: (error, stackTrace) {
    ApiFailure? apiFailure;
    if (error is DioError) {
      final responseFailure = error.response?.data;
      if (responseFailure is Map<String, dynamic>) {
        apiFailure = _parseApiFailure(responseFailure);
      } else {
        apiFailure = ApiFailure.httpError(error.response?.statusCode);
      }
    }

    return apiFailure ?? ApiFailure.unknown();
  },
);

ApiFailure? _parseApiFailure(Map<String, dynamic> json) {
  final error = json['error'];
  if (error is Map<String, dynamic>) {
    return ApiFailure.serverFailure(error['message']);
  } else {
    return null;
  }
}

final parseApiResponse = _exampleResponseParser.parseApiResponse;
final parseListApiResponse = _exampleResponseParser.parseListApiResponse;
final parseEmptyApiResponse = _exampleResponseParser.parseEmptyApiResponse;

Future<void> main() async {
  final dio = Dio(BaseOptions(baseUrl: 'https://example.com'));

  final userResult = await parseApiResponse(
    requestAction: () => dio.get('/user'),
    mapper: User.fromJson,
  );
  userResult.fold(
    (failure) => print('Error: ${failure.displayError}'),
    (user) => print('User is loaded: $user'),
  );

  final usersResult = await parseListApiResponse(
    requestAction: () => dio.get('/user'),
    mapper: User.fromJson,
  );
  usersResult.fold(
    (failure) => print('Error: ${failure.displayError}'),
    (users) => print('Users are loaded: $users'),
  );

  final deleteUserResult = await parseEmptyApiResponse(
    requestAction: () => dio.delete('/user'),
  );
  deleteUserResult.match(
    (failure) => print('Error: ${failure.displayError}'),
    () => print('User is successfully deleted!'),
  );
}

@JsonSerializable()
class User {
  User(this.name);

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  final String name;
}

@freezed
class ApiFailure with _$ApiFailure {
  ApiFailure._();
  factory ApiFailure.unknown() = _UnknownApiFailure;
  factory ApiFailure.serverFailure(String errorMessage) = _ServerFailure;
  factory ApiFailure.httpError(int? statusCode) = _HttpError;

  String get displayError => when(
        unknown: () => 'Unknown',
        serverFailure: (errorMessage) => errorMessage,
        httpError: (statusCode) => 'Http error with status code $statusCode',
      );
}
