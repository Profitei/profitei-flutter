part of 'summary_fetch_cubit.dart';

@immutable
abstract class RaffleSummaryFetchState {
  final List<RaffleSummary> raffleSummary;
  const RaffleSummaryFetchState(this.raffleSummary);
}

class RaffleSummaryFetchInitial extends RaffleSummaryFetchState {
  const RaffleSummaryFetchInitial(super.raffleSummary);
}

class RaffleSummaryFetchLoading extends RaffleSummaryFetchState {
  const RaffleSummaryFetchLoading(super.raffleSummary);
}

class RaffleSummaryFetchSuccess extends RaffleSummaryFetchState {
  const RaffleSummaryFetchSuccess(super.raffleSummary);
}

class RaffleSummaryFetchFail extends RaffleSummaryFetchState {
  const RaffleSummaryFetchFail(super.raffleSummary);
}
