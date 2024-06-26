import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:http/http.dart' as http;
import 'package:jokes_app/components/data.dart';
import 'package:jokes_app/models/joke_model.dart';

part 'joke_index_state.dart';

class JokeIndexCubit extends Cubit<JokeIndexState> {
  JokeIndexCubit() : super(JokeIndexInitial());

  void incrementIndex() async {
    if (state is JokeIndexLoaded) {
      Uri url = Uri.parse('https://official-joke-api.appspot.com/random_joke');
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final jokeJson = json.decode(response.body);
        jokes.add(Joke.fromJson(jokeJson));
      } else {
        emit(JokeIndexError('Failed to load jokes'));
        return;
      }
      final currentIndex = (state as JokeIndexLoaded).index;
      emit(JokeIndexLoaded(currentIndex + 1));
    }
  }

  void decrementIndex() {
    if (state is JokeIndexLoaded) {
      final currentIndex = (state as JokeIndexLoaded).index;
      emit(JokeIndexLoaded(currentIndex - 1));
    }
  }

  void initIndex() async {
    Uri url = Uri.parse('https://official-joke-api.appspot.com/jokes/ten');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final jokesJson = json.decode(response.body) as List<dynamic>;
      jokes.addAll(jokesJson.map((jokeJson) => Joke.fromJson(jokeJson)));
      emit(JokeIndexLoaded(0));
    } else {
      emit(JokeIndexError('Failed to load jokes'));
    }
  }
}
