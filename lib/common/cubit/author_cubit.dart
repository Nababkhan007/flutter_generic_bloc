import 'package:flutter_generic_bloc/model/author_model.dart';
import 'package:flutter_generic_bloc/repository/author_repository.dart';
import 'package:flutter_generic_bloc/common/bloc/generic_bloc_state.dart';
import 'package:flutter_generic_bloc/common/bloc/generic_bloc_cubit.dart';

class AuthorCubit extends GetDataCubit {
  AuthorRepository repository;

  AuthorCubit({required this.repository}) : super(InitialState()) {
    getAuthor();
  }

  Future<List<AuthorModel>> _getAuthor() async => await repository.getAuthors();

  getAuthor() {
    super.emitDataState<List<AuthorModel?>>(
      fetchData: _getAuthor,
      errorMessage: "Something went wrong!",
      dataNotFoundMessage: "Author not found",
    );
  }
}
