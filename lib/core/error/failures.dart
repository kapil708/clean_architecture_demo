import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  List properties = [];
  Failure(this.properties);

  @override
  List<Object?> get props => [properties];
}

// General failures
class ServerException extends Failure {
  ServerException(super.properties);
}

class CacheException extends Failure {
  CacheException(super.properties);
}
