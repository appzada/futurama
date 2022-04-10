import 'api_manager.dart';
export 'api_manager.dart' show ApiCallResponse;

class GetInfoCall {
  static Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'Get Info',
      apiUrl: 'https://api.sampleapis.com/futurama/info',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
    );
  }
}

class GetQuestionsCall {
  static Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'getQuestions',
      apiUrl: 'https://api.sampleapis.com/futurama/questions',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
    );
  }
}
