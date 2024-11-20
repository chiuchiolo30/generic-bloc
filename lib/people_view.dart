import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:generic_bloc/bloc/generic_bloc.dart';
import 'package:generic_bloc/entities/person.dart';

class PeopleView extends StatelessWidget {
  const PeopleView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GenericBloc<Person>(),
      child: Scaffold(
        floatingActionButton: Builder(
          builder: (context) {
            return FloatingActionButton(
              onPressed: () {
                context.read<GenericBloc<Person>>().add(GenericActionCustom(
                      () async {
                        log("Generic action - person");
                      },
                    ));
              },
              child: const Icon(Icons.refresh),
            );
          }
        ),
        appBar: AppBar(
          title: const Text('People'),
        ),
        body: BlocBuilder<GenericBloc<Person>, GenericState>(
          builder: (context, state) {
            if (state is GenericInitial) {
              context.read<GenericBloc<Person>>().add(GenericLoad());
            }
            if (state is GenericLoadInProgress) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is GenericLoadSuccess<Person>) {
              return ListView.builder(
                itemCount: state.data.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(state.data[index].name),
                    subtitle: Text(state.data[index].age.toString()),
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
