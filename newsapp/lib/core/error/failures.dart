import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  @override
  // implement props
  List<Object?> get props => [];
  //const Failure([List properties = const<dynamic>[]]) :super(properties);
}

// General failures
class ServerFailure extends Failure {}

class CacheFailure extends Failure {}