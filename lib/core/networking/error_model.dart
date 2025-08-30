import 'package:json_annotation/json_annotation.dart';

part 'error_model.g.dart';

@JsonSerializable()
class ErrorModel {
  String? field;
  String? message;

  ErrorModel({this.field, this.message});

  factory ErrorModel.fromJson(Map<String, dynamic> json) =>
      _$ErrorModelFromJson(json);

  Map<String, dynamic> toJson() => _$ErrorModelToJson(this);
}

@JsonSerializable()
class ErrorResponse {
  String? type;
  String? title;
  int? status;
  String? traceId;

  @JsonKey(ignore: true)
  List<ErrorModel> errors = [];

  ErrorResponse({
    this.type,
    this.title,
    this.status,
    this.traceId,
    List<ErrorModel>? errors,
  }) {
    if (errors != null) this.errors = errors;
  }

  factory ErrorResponse.fromJson(Map<String, dynamic> json) {
    final errors = <ErrorModel>[];
    if (json['errors'] != null && json['errors'] is Map<String, dynamic>) {
      (json['errors'] as Map<String, dynamic>).forEach((key, value) {
        if (value is List) {
          for (var msg in value) {
            errors.add(ErrorModel(field: key, message: msg.toString()));
          }
        }
      });
    }

    return ErrorResponse(
      type: json['type'] as String?,
      title: json['title'] as String?,
      status: json['status'] as int?,
      traceId: json['traceId'] as String?,
      errors: errors,
    );
  }

  Map<String, dynamic> toJson() => {
    'type': type,
    'title': title,
    'status': status,
    'traceId': traceId,
    'errors': {for (var e in errors) e.field ?? 'unknown': [e.message ?? '']}
  };
}
