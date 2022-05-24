import 'package:breaking_bad_app/core/failures/failures.dart';

class DatabaseError extends Failures{
  String? errorMessage;
  int? statusCode;

  DatabaseError({this.errorMessage, this.statusCode});

}