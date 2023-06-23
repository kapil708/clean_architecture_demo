import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  List properties = [];
  Failure(this.properties);

  @override
  List<Object?> get props => [properties];
}
