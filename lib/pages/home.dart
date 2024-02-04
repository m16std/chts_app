import 'package:chts_app/pages/bloc/coins_list_bloc.dart';
import 'package:chts_app/pages/widgets/home_page_widgets.dart';
import 'package:chts_app/repositories/repositories.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _coinsListBloc = CoinsListBloc(GetIt.I<AbstractCoinsRepository>());

  @override
  void initState() {
    _coinsListBloc.add(LoadCoinsList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 37, 37, 48),
        appBar: appBar(context),
        body: homeBody());
  }

  Column homeBody() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      //searchField(),
      const SizedBox(
        height: 10,
      ),
      listField(_coinsListBloc),
    ]);
  }
}
