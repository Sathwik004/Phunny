part of 'jokes_bloc.dart';

abstract class JokesEvent extends Equatable {
  const JokesEvent();

  @override
  List<Object> get props => [];
}

class FetchJokes extends JokesEvent {}//Fetch saved jokes from local storage

class AddJoke extends JokesEvent {//Add new joke to the list
  final Joke joke;

  const AddJoke(this.joke);

  @override
  List<Object> get props => [joke];
}

//One more to update all jokes to local storage - called inside destructor
class SaveJokes extends JokesEvent{
  final List<Joke> jokes;

  const SaveJokes(this.jokes);

  @override
  List<Object> get props => [jokes];
}