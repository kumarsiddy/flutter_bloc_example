import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_example/bloc/counter_bloc.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CounterBloc(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter Bloc'),
        ),
        body: _CounterScreen(),
      ),
    );
  }
}

class _CounterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CounterBloc, CounterState>(
      builder: (context, state) {
        return Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'You have pushed the button this many times:',
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 16,
                ),
                child: Text(
                  '${state.store.counter ?? 0} Times',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () => _onIncrement(context),
                    icon: const Icon(
                      Icons.add_circle,
                      size: 48,
                      color: Colors.blue,
                    ),
                  ),
                  const SizedBox(width: 16),
                  IconButton(
                    onPressed: () => _onDecrement(context),
                    icon: const Icon(
                      Icons.remove_circle,
                      size: 48,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  void _onIncrement(
    BuildContext context,
  ) {
    // Incrementing by 1
    BlocProvider.of<CounterBloc>(context).increment(
      incrementNumber: 1,
    );
  }

  void _onDecrement(
    BuildContext context,
  ) {
    // decrement by 1
    BlocProvider.of<CounterBloc>(context).decrement(
      decrementNumber: 1,
    );
  }
}
