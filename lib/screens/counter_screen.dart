import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:max_hydrated_bloc_app/blocs/blocs.dart';
import 'package:max_hydrated_bloc_app/cubit/cubits.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter with hydrated_bloc'),
      ),
      body: Center(
        child: BlocBuilder<CounterBloc, CounterState>(
          builder: (context, state) {
            if (state.status == CounterStatus.initial ||
                state.status == CounterStatus.loading) {
              return const CircularProgressIndicator();
            }
            if (state.status == CounterStatus.success) {
              return Text(
                'The counter value is: ${state.counter.value}',
              );
            } else {
              return const Text('Something went wrong.');
            }
          },
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: 'brightness_toggle',
            onPressed: () {
              context.read<BrightnessCubit>().toggleBrightness();
            },
            child: const Icon(Icons.light),
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            heroTag: 'counter_add',
            onPressed: () {
              context.read<CounterBloc>().add(CounterIncrementPressed());
            },
            child: const Icon(Icons.add),
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            heroTag: 'counter_remove',
            onPressed: () {
              context.read<CounterBloc>().add(CounterDecrementPressed());
            },
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
