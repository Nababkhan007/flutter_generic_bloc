import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_generic_bloc/model/author_model.dart';
import 'package:flutter_generic_bloc/common/cubit/author_cubit.dart';
import 'package:flutter_generic_bloc/repository/author_repository.dart';
import 'package:flutter_generic_bloc/common/bloc/generic_bloc_state.dart';

class AuthorView extends StatelessWidget {
  const AuthorView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text(
          "Article",
          style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Colors.white),
        ),
      ),
      body: BlocProvider(
        create: (context) => AuthorCubit(repository: AuthorRepository()),
        child: BlocBuilder<AuthorCubit, BlocState>(
          builder: (context, state) {
            if (state is LoadingState) {
              return const Center(
                child: CircularProgressIndicator(color: Colors.teal),
              );
            }
            if (state is DataFoundState<List<AuthorModel?>>) {
              return ListView.builder(
                  itemCount: state.data.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          Text("${index + 1}."),
                          const SizedBox(width: 10.0),
                          Expanded(
                            child: Card(
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Image.network(state.data[index]!.thumbnail!, height: 100.0, width: 100.0),
                                  ),
                                  const SizedBox(height: 10.0),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        children: [
                                          Text(
                                            state.data[index]!.title!,
                                            style: Theme.of(context).textTheme.bodyLarge,
                                          ),
                                          const SizedBox(height: 10.0),
                                          Text(
                                            state.data[index]!.content!,
                                            style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Colors.black38),
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 3,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  });
            }
            if (state is DataNotFoundState) Text(state.message);
            if (state is ErrorState) Text(state.message);

            return Container();
          },
        ),
      ),
    );
  }
}
