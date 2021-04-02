import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_boilerplate/core/business/bloc/counter_bloc.dart';
import 'package:flutter_boilerplate/core/business/cubit/counter_cubit.dart';
import 'package:flutter_boilerplate/core/presentation/home_bloc/index.dart';

class CounterCubitPage extends StatefulWidget {
  @override
  _CounterCubitPageState createState() => _CounterCubitPageState();
}

class _CounterCubitPageState extends State<CounterCubitPage> {
  void goToBlocCounter() {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => BlocProvider(
                create: (BuildContext context) => CounterBloc(),
                child: CounterBlocPage(),
              )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cubit Counter')),
      body: BlocBuilder<CounterCubit, int>(
        builder: (context, count) => Center(child: Text('$count')),
      ),
      floatingActionButton: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0),
            child: FloatingActionButton(
              heroTag: 'increment',
              child: const Icon(Icons.add),
              onPressed: () => context.read<CounterCubit>().increment(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0),
            child: FloatingActionButton(
              heroTag: 'decrement',
              child: const Icon(Icons.remove),
              onPressed: () => context.read<CounterCubit>().decrement(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0),
            child: FloatingActionButton(
              heroTag: 'nav',
              child: const Text('Bloc'),
              onPressed: goToBlocCounter,
            ),
          ),
        ],
      ),
    );
  }
}
