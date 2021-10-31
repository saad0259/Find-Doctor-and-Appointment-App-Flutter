enum ResponseModeType { Success, Error }

class ResponseModel {
  final ResponseModeType type;
  final String message;
  final data;

  ResponseModel(ResponseModeType type1, {
    required this.type,
    required this.message,
    this.data,
  });
}
