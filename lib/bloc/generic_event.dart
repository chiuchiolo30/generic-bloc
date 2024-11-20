part of 'generic_bloc.dart';

sealed class GenericEvent extends Equatable {
  const GenericEvent();
  @override
  List<Object?> get props => [];
}

final class GenericLoad extends GenericEvent {}

final class GenericAdd<T> extends GenericEvent {
  final T item;
  const GenericAdd(this.item);
  @override
  List<Object?> get props => [item];
}

final class GenericDelete<T> extends GenericEvent {
  final T item;
  const GenericDelete(this.item);
  @override
  List<Object?> get props => [item];
}

final class GenericUpdate<T> extends GenericEvent {
  final T item;
  const GenericUpdate(this.item);
  @override
  List<Object?> get props => [item];
}

final class GenericActionCustom<T> extends GenericEvent {
  final Function action;
  const GenericActionCustom(this.action);
  @override
  List<Object?> get props => [action];
}
