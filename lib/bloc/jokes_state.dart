part of 'jokes_bloc.dart';

abstract class JokesState extends Equatable {
  const JokesState();

  @override
  List<Object> get props => [];
}

final class JokesInitial extends JokesState {

}

final class JokesLoaded extends JokesState {
  final List<Joke> jokes;

  const JokesLoaded(this.jokes);

  @override
  List<Object> get props => [jokes];
}

final class JokesError extends JokesState {
  final String message;

  const JokesError(this.message);

  @override
  List<Object> get props => [message];
}


