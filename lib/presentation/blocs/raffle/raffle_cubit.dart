import 'package:bloc/bloc.dart';
import 'package:profitei_flutter/domain/usecases/raffle/get_remote_raffle_usecase.dart';

import '../../../../domain/entities/raffle/raffle.dart';

part 'raffle_state.dart';

class RaffleCubit extends Cubit<RaffleState> {
  final GetRemoteRaffleUseCase _getRaffleUseCase;
  RaffleCubit(this._getRaffleUseCase) : super(const RaffleInitial());

  void getRaffle(num id) async {
    try {
      emit(RaffleLoading(raffle: state.raffle));
      final remoteResult = await _getRaffleUseCase(id);
      remoteResult.fold(
        (failure) => emit(RaffleFail(raffle: state.raffle)),
        (raffle) => emit(RaffleSuccess(raffle: raffle)),
      );
    } catch (e) {
      emit(RaffleFail(raffle: state.raffle));
    }
  }
}
