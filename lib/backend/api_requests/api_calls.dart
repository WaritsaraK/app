import 'dart:convert';
import 'dart:typed_data';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class ShowNewsCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'ShowNews',
      apiUrl: 'https://app-meds-default-rtdb.firebaseio.com/.json',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static List? news(dynamic response) => getJsonField(
        response,
        r'''$.news''',
        true,
      ) as List?;
  static List? author(dynamic response) => getJsonField(
        response,
        r'''$.news[:].author''',
        true,
      ) as List?;
  static List? id(dynamic response) => getJsonField(
        response,
        r'''$.news[:].id''',
        true,
      ) as List?;
  static List? more(dynamic response) => getJsonField(
        response,
        r'''$.news[:].more''',
        true,
      ) as List?;
  static List? from(dynamic response) => getJsonField(
        response,
        r'''$.news[:].news_from''',
        true,
      ) as List?;
  static List? date(dynamic response) => getJsonField(
        response,
        r'''$.news[:].publishedAt''',
        true,
      ) as List?;
  static List? title(dynamic response) => getJsonField(
        response,
        r'''$.news[:].title''',
        true,
      ) as List?;
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return isList ? '[]' : '{}';
  }
}
