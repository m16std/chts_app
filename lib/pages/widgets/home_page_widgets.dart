import 'package:chts_app/pages/bloc/coins_list_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

SizedBox listField(CoinsListBloc _coinsListBloc) {
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
                      onPressed: () {
                        _coinsListBloc.add(LoadCoinsList());
                      },
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

ListTile coinTile(
    CoinsListLoaded state, int index, String bobrName, BuildContext context) {
  return ListTile(
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(15))),
    leading: Image.network(
      state.coinsList[index].imageUrl,
      width: 40,
      height: 40,
    ),
    title: Text(
      '$bobrName kurwa',
      style: Theme.of(context).textTheme.bodyMedium,
    ),
    subtitle: Text(
      '${state.coinsList[index].price} USD bydle jebane',
      style: Theme.of(context).textTheme.bodySmall,
    ),
    trailing: const Icon(
      Icons.arrow_forward_ios,
      size: 20.0,
    ),
    onTap: () {
      Navigator.of(context).pushNamed('/bobr', arguments: bobrName);
    },
  );
}

AppBar appBar(context) {
  return AppBar(
      scrolledUnderElevation: 0.0,
      backgroundColor: Color.fromARGB(255, 37, 37, 48),
      title: Text(
        'ej kurwa bober',
        style: Theme.of(context).textTheme.bodyLarge,
      ),
      centerTitle: true,
      leading: GestureDetector(
        onTap: () {},
        child: Container(
            margin: const EdgeInsets.all(10),
            alignment: Alignment.center,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
            child: const Icon(Icons.arrow_back_ios)),
      ),
      actions: [
        GestureDetector(
          onTap: () {},
          child: Container(
              margin: const EdgeInsets.all(10),
              alignment: Alignment.center,
              width: 37,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(15)),
              child: const Icon(Icons.more_horiz)),
        ),
      ]);
}

Container searchField() {
  return Container(
    margin: const EdgeInsets.only(top: 30, left: 20, right: 20),
    child: TextField(
      decoration: InputDecoration(
          filled: true,
          fillColor: const Color.fromARGB(255, 255, 255, 255).withOpacity(0.1),
          contentPadding: const EdgeInsets.all(15),
          hintText: 'Ja pierdolę',
          hintStyle: const TextStyle(color: Color.fromARGB(220, 255, 255, 255)),
          prefixIcon: Padding(
            padding: const EdgeInsets.all(12),
            child: SvgPicture.asset(
              'assets/icons/Search.svg',
            ),
          ),
          suffixIcon: SizedBox(
            width: 100,
            child: IntrinsicHeight(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const VerticalDivider(
                    color: Colors.black,
                    thickness: 0.1,
                    indent: 10,
                    endIndent: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: SvgPicture.asset(
                      'assets/icons/Filter.svg',
                    ),
                  ),
                ],
              ),
            ),
          ),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide.none)),
    ),
  );
}
