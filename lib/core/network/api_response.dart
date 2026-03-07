import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_response.freezed.dart';
part 'api_response.g.dart';

@Freezed(genericArgumentFactories: true)
class ApiResponse<T> with _$ApiResponse<T> {
  const factory ApiResponse({
    required bool success,
    required String message,
    required T? data,
    Map<String, dynamic>? errors,
    Map<String, dynamic>? meta,
  }) = _ApiResponse<T>;

  factory ApiResponse.fromJson(
      Map<String, dynamic> json,
      T Function(Object?) fromJsonT,
      ) =>
      _$ApiResponseFromJson(json, fromJsonT);
}

// Success Response
class SuccessResponse<T> {
  final T data;
  final String message;

  SuccessResponse({required this.data, required this.message});
}

// Error Response
class ErrorResponse {
  final String message;
  final Map<String, dynamic>? errors;
  final int? statusCode;

  ErrorResponse({
    required this.message,
    this.errors,
    this.statusCode,
  });
}