import 'base_errors_model.dart';

class BaseModel {
  late final dynamic data;
  final int totalResults;
  final String status;
  BaseErrorsModel? errors;

  BaseModel({
    required this.data,
    required this.totalResults,
    required this.status,
    this.errors,
  });
}
