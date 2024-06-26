part of 'joke_index_cubit.dart';

abstract class JokeIndexState {}

final class JokeIndexInitial extends JokeIndexState {}

final class JokeIndexLoaded extends JokeIndexState {
  final int index;

  JokeIndexLoaded(this.index);
}

final class JokeIndexError extends JokeIndexState {
  final String message;

  JokeIndexError(this.message);
}