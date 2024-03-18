class AppException implements Exception{
  final String code;
  final String? message;

  AppException(this.code,this.message);
}