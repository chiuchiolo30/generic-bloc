import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:generic_bloc/bloc/generic_bloc.dart';
import 'package:generic_bloc/entities/car.dart';

class CarsView extends StatelessWidget {
  const CarsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GenericBloc<Car>(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Cars'),
        ),
        body: BlocBuilder<GenericBloc<Car>, GenericState>(
          builder: (context, state) {
            if (state is GenericInitial) {
              context.read<GenericBloc<Car>>().add(GenericLoad());
            }
            if (state is GenericLoadInProgress) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is GenericLoadSuccess<Car>) {
              return ListView.builder(
                itemCount: state.data.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(state.data[index].brand),
                    subtitle: Text(state.data[index].model),
                  );
                },
              );
            }

            return Container();
          },
        ),
      ),
    );
  }
}
