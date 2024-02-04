// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'coins_list_bloc.dart';

class CoinsListState {}

class CoinsListInitial extends CoinsListState {}

class CoinsListLoading extends CoinsListState {}

class CoinsListLoaded extends CoinsListState {
  final List<Coin> coinsList;
  CoinsListLoaded({
    required this.coinsList,
  });
}

class CoinsListLoadingFailre extends CoinsListState {
  final Object? exception;
  CoinsListLoadingFailre({
    this.exception,
  });
}
