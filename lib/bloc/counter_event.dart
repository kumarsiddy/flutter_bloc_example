part of 'counter_bloc.dart';

abstract class CounterEvent {}

class CounterIncrementEvent extends CounterEvent {
  final int incrementNumber;

  CounterIncrementEvent({
    required this.incrementNumber,
  });
}

class CounterDecrementEvent extends CounterEvent {
  final int decrementNumber;

  CounterDecrementEvent({
    required this.decrementNumber,
  });
}
