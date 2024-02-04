import 'package:chts_app/repositories/repositories.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'coins_list_event.dart';
part 'coins_list_state.dart';

class CoinsListBloc extends Bloc<CoinsListEvent, CoinsListState> {
  CoinsListBloc(this.coinsRepository) : super(CoinsListInitial()) {
    on<LoadCoinsList>((event, emit) async {
      try {
        emit(CoinsListLoading());
        debugPrint('запрос сука');
        final coinsList = await coinsRepository.getCoinsList();
        emit(CoinsListLoaded(coinsList: coinsList));
      } catch (e) {
        emit(CoinsListLoadingFailre(exception: e));
      }
    });
  }
  final AbstractCoinsRepository coinsRepository;
}
