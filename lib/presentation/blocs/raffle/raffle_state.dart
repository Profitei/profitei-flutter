part of 'raffle_cubit.dart';

abstract class RaffleState {
  final Raffle? raffle; // Agora raffle é opcional e pode ser nulo
  const RaffleState({this.raffle});
}

class RaffleInitial extends RaffleState {
  const RaffleInitial({super.raffle}); // Raffle é opcional aqui
}

class RaffleLoading extends RaffleState {
  const RaffleLoading(
      {required super.raffle}); // Raffle é obrigatório e deve ser fornecido
}

class RaffleSuccess extends RaffleState {
  const RaffleSuccess(
      {required super.raffle}); // Raffle é obrigatório e deve ser fornecido
}

class RaffleFail extends RaffleState {
  const RaffleFail(
      {required super.raffle}); // Raffle é obrigatório e deve ser fornecido
}
