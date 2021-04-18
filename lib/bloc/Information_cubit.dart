import 'package:flutter_bloc/flutter_bloc.dart';

import '../repository/informations_repository.dart';
import 'info_states.dart';

class InformationCubit extends Cubit<InfoState> {
  InformationCubit() : super(InfoInitialize());

  void fetchData() async {
    final InformationRepository _repository = InformationRepository();
    try {
      emit(InfoLoading());
      final _response = await _repository.fetcInformations();
      emit(InfoSucces(_response));
    } catch (e) {
      emit(InfoError(e.message));
    }
  }

  void loading() {
    emit(InfoLoading());
  }
}
