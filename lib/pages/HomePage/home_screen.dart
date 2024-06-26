import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jokes_app/bloc/jokes_bloc.dart';
import 'package:jokes_app/components/appbar.dart';
import 'package:jokes_app/components/bottom_navbar.dart';
import 'package:jokes_app/components/data.dart';
import 'package:jokes_app/cubit/joke_index_cubit.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize:  Size.fromHeight(kToolbarHeight),
        child: MyAppBar(title: "Jokes"),
      ),
      body: BlocBuilder<JokeIndexCubit, JokeIndexState>(
        builder: (context, state) {
          if (state is JokeIndexInitial || state is JokeIndexError) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is JokeIndexLoaded) {
            return Center(
              child: SizedBox(
                height: double.infinity,
                width: double.infinity,
                child: GestureDetector(
                  
                    onDoubleTap: () {
                      context.read<JokesBloc>().add(AddJoke(jokes[state.index]));
                    },
                    onVerticalDragStart: (details) {
                      context.read<JokeIndexCubit>().incrementIndex();
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(jokes[state.index].setup, style: GoogleFonts.kranky(fontSize: 22),textAlign: TextAlign.center,),
                          const SizedBox(height: 20.0,),
                          Text(jokes[state.index].punchline, style: GoogleFonts.architectsDaughter(fontSize:24), textAlign: TextAlign.center),
                        ],
                      ),
                    )),
              ),
            );
          } else {
            return const Center(
              child: Text('Something went wrong'),
            );
          }
        },
      ),
      bottomNavigationBar: const MyBottomNavBar(),
    );
  }
}
