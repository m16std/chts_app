import 'dart:ffi';

import 'package:chts_app/repositories/models/coin_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class CoinsRepository {
  Future<List<Coin>> getCoinsList() async {
    final response = await Dio().get(
        'https://min-api.cryptocompare.com/data/pricemulti?fsyms=BTC,ETH,BONK,DOGE,KAS&tsyms=USD');
    debugPrint(response.toString());
    final data = response.data as Map<String, dynamic>;
    final coinsList = data.entries
        .map((e) => Coin(
              name: e.key,
              price: (e.value as Map<String, dynamic>)['USD'],
            ))
        .toList();
    return coinsList;
  }
}
