import 'package:dio/dio.dart';

/// Data state
abstract class DataState<T> {
  /// Data
  final T? data;

  /// Error
  final DioException? error;

  const DataState({this.data, this.error});
}

/// Data success
class DataSuccess<T> extends DataState<T> {
  DataSuccess(T data) : super(data: data);
}

/// Data error
class DataError<T> extends DataState<T> {
  DataError(DioException error) : super(error: error);
}
