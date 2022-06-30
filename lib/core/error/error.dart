import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  @override
  List<Object> get props => [];
}

// General failures
class ServerFailure extends Failure {}

class CacheFailure extends Failure {}

//Booking Failures
class BookingFailure extends Failure {}

class BookingFailureMaxSlotsReached extends Failure {}
