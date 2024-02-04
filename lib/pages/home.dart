import 'package:chts_app/pages/bloc/coins_list_bloc.dart';
import 'package:chts_app/pages/widgets/home_page_widgets.dart';
import 'package:chts_app/repositories/repositories.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
      listField(),
    ]);
  }

  SizedBox listField() {
    return SizedBox(
      height: 690,
      child: BlocBuilder<CoinsListBloc, CoinsListState>(
        bloc: _coinsListBloc,
        builder: (context, state) {
          if (state is CoinsListLoaded) {
            return ListView.separated(
                itemCount: state.coinsList.length,
                scrollDirection: Axis.vertical,
                padding: const EdgeInsets.only(left: 20, right: 20),
                separatorBuilder: (context, index) => const SizedBox(
                      height: 10,
                    ),
                itemBuilder: (context, index) {
                  final bobrName = state.coinsList[index].name;
                  return coinTile(state, index, bobrName, context);
                });
          }
          if (state is CoinsListLoadingFailre) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Text(state.exception?.toString() ?? 'Ошибка блять',
                        style: Theme.of(context).textTheme.bodyMedium),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Text(
                        '(ебать лошара)',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 30.0),
                      child: FloatingActionButton.extended(
                        onPressed: () {},
                        label: const Text('Наступить на грабли'),
                        icon: const Icon(Icons.replay_outlined),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
