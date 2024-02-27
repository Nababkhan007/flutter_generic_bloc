import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_generic_bloc/common/bloc/generic_bloc_state.dart';

class GetDataCubit extends Cubit<BlocState> {
  GetDataCubit(InitialState super.initializeState);

  _emitState(BlocState state) {
    if (!isClosed) {
      emit(state);
    }
  }

  emitDataState<T>({required Future<T> Function() fetchData, required String errorMessage, required String dataNotFoundMessage}) async {
    try {
      _emitState(LoadingState());
      final data = await fetchData();
      if (data != null) {
        if (!super.isClosed) {
          _emitState(DataFoundState<T>(data: data));
        }
      } else {
        if (!super.isClosed) {
          _emitState(DataNotFoundState(
            message: dataNotFoundMessage,
          ));
        }
      }
    } catch (e) {
      if (!super.isClosed) {
        _emitState(ErrorState(
          message: errorMessage,
        ));
      }
    }
  }
}
