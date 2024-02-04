// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'package:chts_app/repositories/repositories.dart';

class CoinsRepository implements AbstractCoinsRepository {
  CoinsRepository({
    required this.dio,
  });
  final Dio dio;

  @override
  Future<List<Coin>> getCoinsList() async {
    final response = await Dio().get(
        'https://min-api.cryptocompare.com/data/pricemultifull?fsyms=BTC,ETH,BNB,XRP,TON,NEAR,BONK,DOGE,KAS,SOD,AID,SOL,CAD,DOV,SEI,RUNE&tsyms=USD');
    //debugPrint(response.toString());
    final rawData = response.data as Map<String, dynamic>;
    final data = rawData['RAW'] as Map<String, dynamic>;
    final coinsList = data.entries.map((e) {
      final usdData =
          (e.value as Map<String, dynamic>)['USD'] as Map<String, dynamic>;
      final price = usdData['PRICE'];
      final imageUrl = usdData['IMAGEURL'];

      return Coin(
        name: e.key,
        price: price,
        imageUrl: 'https://www.cryptocompare.com/$imageUrl',
      );
    }).toList();
    return coinsList;
  }
}
