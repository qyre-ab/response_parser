part of 'response_parser.dart';

T _dataParser<T>(Object data, JsonMapper<T> mapper) {
  assert(
    data is Map<String, dynamic>,
    "Response data is supposed to be a `Map<String, dynamic>` but not `${data.runtimeType}`."
    "\nData: `$data`",
  );
  return mapper(data as Map<String, dynamic>);
}

List<T> _listDataParser<T>(Object data, JsonMapper<T> mapper) {
  assert(
    data is List && data.every((element) => element is Map<String, dynamic>),
    "Response data is supposed to be a `List<Map<String, dynamic>>` but not `${data.runtimeType}`.\n"
    "Data: `$data`",
  );

  return (data as List).map((e) => mapper(e as Map<String, dynamic>)).toList();
}

Future<Either<Failure, Response>> _tryMakeRequest<Failure, Response>({
  required RequestAction<Response> requestAction,
  required ErrorCatcher<Failure> errorCatcher,
}) async {
  try {
    final response = await requestAction();
    return right(response);
  } catch (e, st) {
    return left(errorCatcher(e, st));
  }
}

Either<Failure, Data> _parseResponse<Failure, Data, Response>(
  Response response, {
  required _DataParser<Data> dataParser,
  required FailureParser<Failure, Response> failureParser,
  required DataExtractor<Response> dataExtractor,
  required ErrorCatcher errorCatcher,
}) {
  try {
    final failure = failureParser(response);
    if (failure != null) {
      return left(failure);
    }

    final responseData = dataExtractor(response);
    assert(
      responseData is List && responseData.every((element) => element is Map) ||
          responseData is Map,
      "Response data supposed to be a List of Maps or a Map",
    );
    return right(dataParser(responseData));
  } catch (e, st) {
    return left(errorCatcher(e, st));
  }
}

typedef _DataParser<T> = T Function(Object data);
