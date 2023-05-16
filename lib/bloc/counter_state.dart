part of 'counter_bloc.dart';

abstract class CounterState {
  final CounterStateStore store;

  CounterState({
    required this.store,
  });
}

class CounterInitialState extends CounterState {
  CounterInitialState({
    required super.store,
  });
}

class CounterUpdateState extends CounterState {
  CounterUpdateState({
    required super.store,
  });
}

@immutable
class CounterStateStore {
  final int? counter;

  const CounterStateStore({
    this.counter,
  });

  CounterStateStore copyWith({
    int? counter,
  }) {
    return CounterStateStore(
      counter: counter ?? this.counter,
    );
  }
}
