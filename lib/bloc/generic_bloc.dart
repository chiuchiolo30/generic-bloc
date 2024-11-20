import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:generic_bloc/db.dart';
import 'package:generic_bloc/entities/car.dart';
import 'package:generic_bloc/entities/person.dart';

part 'generic_event.dart';
part 'generic_state.dart';

Future<List<T>> getData<T>() async {
  await Future.delayed(const Duration(seconds: 2));
  if (T == Person) {
    return Future.value(people as List<T>);
  }
  if (T == Car) {
    return Future.value(cars as List<T>);
  }
  return Future.value([]);
}

class GenericBloc<T> extends Bloc<GenericEvent, GenericState> {
  GenericBloc() : super(GenericInitial()) {
    on<GenericLoad>(_onLoad);
    on<GenericAdd>(_genericAdd);
    on<GenericDelete>(_genericDelete);
    on<GenericUpdate>(_genericUpdate);
    on<GenericActionCustom>(_genericActionCustom);
  }
  FutureOr<void> _onLoad(
    GenericLoad event,
    Emitter<GenericState> emit,
  ) async {
    emit(GenericLoadInProgress());
    final data = await getData<T>();
    emit(GenericLoadSuccess<T>(data));
  }

  FutureOr<void> _genericAdd(
    GenericAdd event,
    Emitter<GenericState> emit,
  ) async {
    if (state is GenericLoadSuccess<T>) {
      final updatedData = List<T>.from((state as GenericLoadSuccess<T>).data)
        ..add(event.item);
      emit(GenericLoadSuccess(updatedData));
    }
  }

  FutureOr<void> _genericDelete(
    GenericDelete event,
    Emitter<GenericState> emit,
  ) async {
    if (state is GenericLoadSuccess<T>) {
      final updatedData = List<T>.from((state as GenericLoadSuccess<T>).data)
        ..remove(event.item);
      emit(GenericLoadSuccess(updatedData));
    }
  }

  FutureOr<void> _genericUpdate(
    GenericUpdate event,
    Emitter<GenericState> emit,
  ) async {
    if (state is GenericLoadSuccess<T>) {
      final index = (state as GenericLoadSuccess<T>).data.indexOf(event.item);
      final updatedData = List<T>.from((state as GenericLoadSuccess<T>).data)
        ..[index] = event.item;
      emit(GenericLoadSuccess(updatedData));
    }
  }

  FutureOr<void> _genericActionCustom(
    GenericActionCustom event,
    Emitter<GenericState> emit,
  ) async {
    event.action();
  }
}
