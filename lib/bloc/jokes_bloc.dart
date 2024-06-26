import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:jokes_app/models/joke_model.dart';

part 'jokes_event.dart';
part 'jokes_state.dart';

class JokesBloc extends Bloc<JokesEvent, JokesState> {
  JokesBloc() : super(JokesInitial()) {
    on<FetchJokes>((event, emit) async {
      final jokes = <Joke>[];

      if (jokes.isEmpty) {
        // //try retrieving jokes
        // var data = [{"type":"general","setup":"What did the Dorito farmer say to the other Dorito farmer?","punchline":"Cool Ranch!","id":173},{"type":"general","setup":"Why did the fireman wear red, white, and blue suspenders?","punchline":"To hold his pants up.","id":329},{"type":"general","setup":"Why did the man run around his bed?","punchline":"Because he was trying to catch up on his sleep!","id":335},{"type":"general","setup":"What happens when you anger a brain surgeon?","punchline":"They will give you a piece of your mind.","id":242},{"type":"general","setup":"Why do bears have hairy coats?","punchline":"Fur protection.","id":347},{"type":"general","setup":"What did the Buffalo say to his little boy when he dropped him off at school?","punchline":"Bison.","id":170},{"type":"knock-knock","setup":"Knock knock. \n Who's there? \n A broken pencil. \n A broken pencil who?","punchline":"Never mind. It's pointless.","id":12},{"type":"general","setup":"Where does Fonzie like to go for lunch?","punchline":"Chick-Fil-Eyyyyyyyy.","id":296},{"type":"general","setup":"What is the difference between ignorance and apathy?","punchline":"I don't know and I don't care.","id":249},{"type":"general","setup":"What does the mermaid wear to math class?","punchline":"Algae-bra.","id":401}];
        // jokes.addAll(data.map((jokeJson) => Joke.fromJson(jokeJson)));
        // print(jokes.toString());
        emit(JokesLoaded(jokes));
        return;
      }

      
      else {
        emit(const JokesError('No jokes were saved'));
      }
    });
    on<AddJoke>((event, emit) {
      final jokes = (state as JokesLoaded).jokes;
      jokes.add(event.joke);
      emit(JokesLoaded(jokes));
    });
    on<SaveJokes>((event, emit) {
      final jokes = (state as JokesLoaded).jokes;
      // Save jokes to local storage
      // ...

      emit(JokesLoaded(jokes));
    });
  }
}
