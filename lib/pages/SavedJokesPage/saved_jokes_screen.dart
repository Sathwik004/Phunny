import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jokes_app/bloc/jokes_bloc.dart';
import 'package:jokes_app/components/appbar.dart';
import 'package:jokes_app/components/bottom_navbar.dart';

class SavedJokesScreen extends StatelessWidget {
  const SavedJokesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: MyAppBar(title: "Saved Jokes"),
      ),
      body: Center(
        child: BlocBuilder<JokesBloc, JokesState>(
          builder: (context, state) {
            if (state is JokesInitial) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if (state is JokesLoaded) {
              return ListView.builder(
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ExpansionTile(
                    title: Text(state.jokes[index].setup),
                    childrenPadding: const EdgeInsets.all(16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    expandedAlignment: Alignment.centerLeft,
                    children: [Text(state.jokes[index].punchline)],
                  ),
                ),
                itemCount: state.jokes.length,
              );
            }
            if (state is JokesError) {
              return const Center(
                child: Text('No jokes saved yet'),
              );
            } else {
              return const Center(
                child: Text('Something went wrong'),
              );
            }
          },
        ),
      ),
      bottomNavigationBar: const MyBottomNavBar(),
    );
  }
}
