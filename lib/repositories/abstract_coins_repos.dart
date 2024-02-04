import 'package:chts_app/repositories/models/models.dart';

abstract class AbstractCoinsRepository {
  Future<List<Coin>> getCoinsList();
}
