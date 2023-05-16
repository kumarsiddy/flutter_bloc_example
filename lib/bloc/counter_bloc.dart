import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'counter_event.dart';

part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc()
      : super(
          CounterInitialState(
            store: const CounterStateStore(
              counter: 0,
            ),
          ),
        ) {
    on<CounterIncrementEvent>(_onCounterIncrement);
    on<CounterDecrementEvent>(_onCounterDecrement);
  }

  Future<void> _onCounterIncrement(
    CounterIncrementEvent event,
    Emitter<CounterState> emit,
  ) async {
    final counter = state.store.counter! + event.incrementNumber;
    emit(
      CounterUpdateState(
        store: state.store.copyWith(
          counter: counter,
        ),
      ),
    );
  }

  Future<void> _onCounterDecrement(
    CounterDecrementEvent event,
    Emitter<CounterState> emit,
  ) async {
    final counter = state.store.counter! - event.decrementNumber;
    emit(
      CounterUpdateState(
        store: state.store.copyWith(
          counter: counter,
        ),
      ),
    );
  }

  void increment({
    required int incrementNumber,
  }) {
    add(
      CounterIncrementEvent(
        incrementNumber: incrementNumber,
      ),
    );
  }

  void decrement({
    required int decrementNumber,
  }) {
    add(
      CounterDecrementEvent(
        decrementNumber: decrementNumber,
      ),
    );
  }
}
