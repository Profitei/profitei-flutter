import 'package:bloc/bloc.dart';

import '../../../../core/usecases/usecase.dart';
import '../../../../domain/entities/summary/summary.dart';
import 'package:profitei_flutter/domain/usecases/raffle/get_remote_raffle_summary_usecase.dart';

part 'summary_fetch_state.dart';

class RaffleSummaryFetchCubit extends Cubit<RaffleSummaryFetchState> {
  final GetRemoteRaffleSummaryUseCase _getRaffleSummaryUseCase;
  RaffleSummaryFetchCubit(this._getRaffleSummaryUseCase)
      : super(const RaffleSummaryFetchInitial([]));

  void getRaffleSummaries() async {
    try {
      emit(RaffleSummaryFetchLoading(state.raffleSummary));      
      final remoteResult = await _getRaffleSummaryUseCase(NoParams());
      remoteResult.fold(
        (failure) => emit(RaffleSummaryFetchFail(state.raffleSummary)),
        (raffleSummaries) => emit(RaffleSummaryFetchSuccess(raffleSummaries)),
      );
    } catch (e) {
      emit(RaffleSummaryFetchFail(state.raffleSummary));
    }
  }
}
