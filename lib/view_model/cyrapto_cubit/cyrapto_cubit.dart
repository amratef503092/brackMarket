import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:renters/data/repo/repo.dart';

part 'cyrapto_state.dart';

class CyraptoCubit extends Cubit<CyraptoState> {
  CyraptoCubit() : super(CyraptoInitial());
  DataCoinRepo dataCoinRepo = DataCoinRepoImpl();

  void getCyraptoData() async {
    emit(CyraptoLoading());
    // final result = await dataCoinRepo.getCyraptoData();
    // result.fold((l) => emit(CyraptoError(l.message)), (r) => emit(CyraptoLoaded(r)));
  }
}
