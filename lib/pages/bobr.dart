import 'dart:developer';

import 'package:chts_app/pages/home.dart';
import 'package:flutter/material.dart';

class BobrPage extends StatefulWidget {
  const BobrPage({super.key});

  @override
  State<BobrPage> createState() => _BobrPageState();
}

class _BobrPageState extends State<BobrPage> {
  String? bobrName;

  @override
  void didChangeDependencies() {
    final args = ModalRoute.of(context)?.settings.arguments;
    assert(args != null && args is String, 'BobrPage args kurwa');
    bobrName = args as String;
    setState(() {});
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 36, 36, 36),
        appBar: AppBar(
            scrolledUnderElevation: 0.0,
            backgroundColor: const Color.fromARGB(255, 36, 36, 36),
            title: Text(
              bobrName ?? '...',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            centerTitle: true,
            leading: GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed('/');
              },
              child: Container(
                  margin: const EdgeInsets.all(10),
                  alignment: Alignment.center,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(15)),
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
            ]),
        body: Container(
          child: Text('Ja pierdolę, patrzcie co spotkałem. $bobrName, kurwa!'),
        ));
  }
}
