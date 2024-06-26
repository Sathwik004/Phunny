import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jokes_app/bloc/jokes_bloc.dart';
import 'package:jokes_app/cubit/joke_index_cubit.dart';
import 'package:jokes_app/theme.dart';
import 'package:jokes_app/pages/HomePage/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (_) => JokesBloc()..add(FetchJokes())),
      BlocProvider<JokeIndexCubit>(create: (_) => JokeIndexCubit()..initIndex()),],
      child: MaterialApp(
        title: 'Jokes App',
        theme: ThemeData(
          colorScheme: colorScheme,
            textTheme: GoogleFonts.kufamTextTheme(
            Theme.of(context).textTheme,
            ),
          useMaterial3: true,
        ),
        home: const MyHomePage(),
        darkTheme: ThemeData(
          colorScheme: colorScheme,
          useMaterial3: true,
          
        ),
        
      ),
    );
  }
}
