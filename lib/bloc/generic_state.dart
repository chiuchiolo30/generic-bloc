part of 'generic_bloc.dart';

sealed class GenericState extends Equatable {
  const GenericState();
  @override
  List<Object> get props => [];
}

final class GenericInitial extends GenericState {}

final class GenericLoadInProgress extends GenericState {}

final class GenericLoadSuccess<T> extends GenericState {
  final List<T> data;
  const GenericLoadSuccess(this.data);
  @override
  List<Object> get props => [data];
}

final class GenericLoadFailure extends GenericState {
  final String message;
  const GenericLoadFailure(this.message);
  @override
  List<Object> get props => [message];
}
