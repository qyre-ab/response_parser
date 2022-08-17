Response Parser makes it easier to parse data and error response from server.

## Getting started

Do you want to write this pretty functions...
```dart
Future<Either<User, ApiFailure>> fetchUser() async {
  return parseApiResponse(
    requestAction: () => dio.get('/user'),
    mapper: User.fromJson,
  );
}
```
...instead of this boring code?
```dart
Future<Either<User, ApiFailure>> fetchUser() async {
  final dio = Dio(BaseOptions(baseUrl: 'https://example.com'));
  try {
    final request = await dio.get('/user');
    final data = request.data?['data'];
    if (data == null) {
      final error = request.data?['error'];
      if (error != null) {
        return ApiFailure.serverFailure(error['message']);
      } else {
        return ApiFailure.unknown();
      }
    } else {
      return User.fromJson(data);
    }
  } catch (error, st) {
    ApiFailure? apiFailure;
    if (error is DioError) {
      final responseFailure = error.response?.data;
      if (responseFailure is Map<String, dynamic>) {
        apiFailure = ApiFailure.serverFailure(responseFailure['message']);
      } else {
        apiFailure = ApiFailure.httpError(error.response?.statusCode);
      }
    }
    return apiFailure ?? ApiFailure.unknown();
  }
}
```
Then continue reading!

## Usage

To do so you need to do a little preparation.\
For example lets assume your server returns such response:
```json
{
  "data": {
    // Data you requested
  },
  "error": {
    // Server error which you should parse and show to user
    "message": "Something went wrong"
  }
}
```
And your error model looks this way:
```dart
class ApiFailure {
  factory ApiFailure.unknown() = _UnknownApiFailure;
  factory ApiFailure.serverFailure(String errorMessage) = _ServerFailure;
  factory ApiFailure.httpError(int? statusCode) = _HttpError;
}
```
Then you need to implement `dataExtractor`, `failureParser` and `errorCatcher` this way:
```dart
final _exampleResponseParser = ResponseParser<Response, ApiFailure>(
  dataExtractor: (response) => response.data['data']!,
  failureParser: (response) {
    final error = json['error'];
    if (error is Map<String, dynamic>) {
      return ApiFailure.serverFailure(error['message']);
    } else {
      return null;
    }
  },
  errorCatcher: (error, stackTrace) {
    ApiFailure? apiFailure;
    if (error is DioError) {
      apiFailure = ApiFailure.httpError(error.response?.statusCode);
    }
    return apiFailure ?? ApiFailure.unknown();
  },
);
```
And create top level `parseApiResponse`, `parseListApiResponse` and `parseEmptyApiResponse` functions.
```dart
final parseApiResponse = _exampleResponseParser.parseApiResponse;
final parseListApiResponse = _exampleResponseParser.parseListApiResponse;
final parseEmptyApiResponse = _exampleResponseParser.parseEmptyApiResponse;
```
That's all!\
For more info you can take a look at example.
