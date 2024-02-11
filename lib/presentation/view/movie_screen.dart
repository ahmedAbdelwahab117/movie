import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/presentation/manger/cubit.dart';
import 'package:movie/presentation/manger/state.dart';
import 'package:movie/presentation/view/movie_item.dart';

class MovieScreen extends StatelessWidget {
  const MovieScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MovieCubit()..getMovie(),
      child: BlocConsumer<MovieCubit, MovieStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = MovieCubit.get(context);
          return Scaffold(
            backgroundColor: Colors.teal[500],
            appBar: AppBar(
              centerTitle: true,
              elevation: 0.0,
              backgroundColor: Colors.teal[500],
              title: const Text(
                'Movies',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              actions: [
                IconButton(
                    onPressed: () {
                      cubit.pageRemove();
                    },
                    icon: const Icon(
                      Icons.arrow_circle_left_outlined,
                      color: Colors.black,
                    )),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    "${cubit.page}",
                    style: const TextStyle(fontSize: 20, color: Colors.black),
                  ),
                ),
                IconButton(
                    onPressed: () {
                      cubit.pageAdd();
                    },
                    icon: const Icon(
                      Icons.arrow_circle_right_outlined,
                      color: Colors.black,
                    )),
              ],
            ),
            body: BlocBuilder<MovieCubit, MovieStates>(
              builder: (context, state) {
                if (state is MovieLoadingState) {
                  return Center(
                    child: CircularProgressIndicator(
                      color: Colors.blue[900],
                    ),
                  );
                } else if (state is MovieErrState) {
                  return const Center(child: Text("Error"));
                }
                return Column(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: ListView.separated(
                            itemBuilder: (context, index) => buildMovieItem(
                                context.read<MovieCubit>().allLsit[index]),
                            separatorBuilder: (context, index) =>
                                const SizedBox(
                                  height: 15,
                                ),
                            itemCount: cubit.allLsit.length),
                      ),
                    )
                  ],
                );
              },
            ),
          );
        },
      ),
    );
  }
}
