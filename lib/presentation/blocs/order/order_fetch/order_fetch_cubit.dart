import 'package:bloc/bloc.dart';

import '../../../../core/usecases/usecase.dart';
import '../../../../domain/entities/order/order_details.dart';
import '../../../../domain/usecases/order/get_remote_orders_usecase.dart';

part 'order_fetch_state.dart';

class OrderFetchCubit extends Cubit<OrderFetchState> {
  final GetRemoteOrdersUseCase _getOrdersUseCase;
  OrderFetchCubit(this._getOrdersUseCase)
      : super(const OrderFetchInitial([]));

  void getOrders() async {
    try {
      emit(OrderFetchLoading(state.orders));      
      final remoteResult = await _getOrdersUseCase(NoParams());
      remoteResult.fold(
        (failure) => emit(OrderFetchFail(state.orders)),
        (orders) => emit(OrderFetchSuccess(orders)),
      );
    } catch (e) {
      emit(OrderFetchFail(state.orders));
    }
  }
}
